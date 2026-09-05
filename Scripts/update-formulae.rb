#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "net/http"
require "uri"

FORMULAE = {
  "Formula/wrangler-isotope.rb" => {
    repo: "automic-vault/wrangler",
    asset: /^cli-(.+)\.tgz$/
  },
  "Formula/stripe-cli.rb" => {
    repo: "automic-vault/stripe-cli",
    asset: /^cli-(.+)\.tgz$/
  },
  "Formula/gh-cli.rb" => {
    repo: "automic-vault/gh-cli",
    asset: /^cli-(.+)\.tgz$/
  },
  "Formula/supabase-cli.rb" => {
    repo: "automic-vault/supabase-cli",
    asset: /^cli-(.+)\.tgz$/
  }
}.freeze

def latest_release(repo)
  uri = URI("https://api.github.com/repos/#{repo}/releases/latest")
  req = Net::HTTP::Get.new(uri)
  req["Accept"] = "application/vnd.github+json"
  req["Authorization"] = "Bearer #{ENV.fetch("GITHUB_TOKEN")}" if ENV["GITHUB_TOKEN"]

  res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
  abort "#{repo}: #{res.code} #{res.body}" unless res.is_a?(Net::HTTPSuccess)

  JSON.parse(res.body)
end

FORMULAE.each do |path, config|
  release = latest_release(config[:repo])
  asset = release.fetch("assets").find { |a| a.fetch("name").match?(config[:asset]) }
  abort "#{config[:repo]}: no cli-*.tgz release asset" unless asset

  version = asset.fetch("name")[config[:asset], 1]
  sha256 = asset.fetch("digest").delete_prefix("sha256:")
  url = asset.fetch("browser_download_url")

  formula = File.read(path)
  formula.sub!(/url ".*"/, %(url "#{url}"))
  formula.sub!(/sha256 ".*"/, %(sha256 "#{sha256}"))

  File.write(path, formula)
  puts "#{path}: #{version}"
end
