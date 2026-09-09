# Run with: brew ruby Scripts/test-wrangler-install.rb /path/to/cli-4.129.0.tgz
require "digest"
require "tmpdir"
require "formula"
require "formulary"
require "download_strategy"

# Match Homebrew's build runner, including Pathname#write creating parent directories.
Pathname.activate_extensions!

path = (Pathname(__dir__)/"../Formula/wrangler-isotope.rb").realpath
formula = Formulary.from_contents("wrangler-isotope", path, path.read)
archive = Pathname(ARGV.fetch(0)).realpath
raise "Archive checksum mismatch" unless Digest::SHA256.file(archive).hexdigest == formula.stable.checksum.to_s

Dir.mktmpdir("wrangler-install-") do |directory|
  root = Pathname(directory)
  formula.define_singleton_method(:prefix) { root/"keg" }
  stage = root/"stage"
  stage.mkpath
  downloader = CurlDownloadStrategy.new(formula.stable.url, formula.name, formula.version)
  downloader.define_singleton_method(:cached_location) { archive }
  stage.cd do
    downloader.stage do
      puts "Homebrew staged entries: #{Dir.children('.').sort.join(', ')}"
      formula.install
    end
  end

  bundle = formula.libexec/"Wrangler.app"
  raise "Missing Wrangler runtime" unless (bundle/"Contents/MacOS/wrangler").executable?
  raise "Missing command shim" unless (formula.bin/"wrangler").executable?
  raise "Invalid bundle signature" unless system("/usr/bin/codesign", "--verify", "--deep", "--strict", bundle.to_s)
  puts "PASS: Homebrew installs the published archive and preserves its bundle signature"
end
