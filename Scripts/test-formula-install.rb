# Run with: brew ruby Scripts/test-formula-install.rb Formula/NAME.rb ARCHIVE.tgz
require "digest"
require "tmpdir"
require "formula"
require "formulary"
require "download_strategy"
require "cleaner"
require "keg"
require "formula_assertions"
require "timeout"

Pathname.activate_extensions!
path = Pathname(ARGV.fetch(0)).realpath
formula = Formulary.from_contents(path.basename(".rb").to_s, path, path.read)
archive = Pathname(ARGV.fetch(1)).realpath
raise "Archive checksum mismatch" unless Digest::SHA256.file(archive).hexdigest == formula.stable.checksum.to_s

# Keep the destination outside Homebrew's build temp, as a real Cellar would be.
Dir.mktmpdir("isotope-install-", Dir.home) do |directory|
  root = Pathname(directory)
  formula.define_singleton_method(:prefix) { root/"keg" }
  stage = root/"stage"
  stage.mkpath
  downloader = CurlDownloadStrategy.new(formula.stable.url, formula.name, formula.version)
  downloader.define_singleton_method(:cached_location) { archive }
  stage.cd do
    downloader.stage do
      puts "#{formula.name}: Homebrew staged #{Dir.children('.').sort.join(', ')}"
      formula.install
    end
  end
  Cleaner.new(formula).clean
  keg = Keg.allocate
  keg.instance_variable_set(:@path, formula.prefix)
  keg.instance_variable_set(:@name, formula.name)
  keg.instance_variable_set(:@opt_record, HOMEBREW_PREFIX/"opt/#{formula.name}")
  keg.define_singleton_method(:formula_preserve_rpath?) { formula.preserve_rpath? }
  keg.fix_dynamic_linkage
  commands = formula.bin.children
  raise "No installed commands" if commands.empty?
  commands.each do |command|
    raise "Not executable: #{command}" unless command.executable?
    next unless command.mach_o_executable?
    raise "Invalid signature: #{command}" unless system("/usr/bin/codesign", "--verify", "--strict", command.to_s)
  end
  formula.extend(Homebrew::Assertions)
  Timeout.timeout(300) { formula.run_test }
  puts "PASS: #{formula.name} installs and passes its formula test"
end
