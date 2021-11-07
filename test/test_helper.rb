# frozen_string_literal: true

require "simplecov"
require "simplecov-lcov"
require "simplecov-tailwindcss"

SimpleCov.start do
  add_filter "/test/"
  coverage_dir "test/coverage"

  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::LcovFormatter,
    SimpleCov::Formatter::TailwindFormatter
  ])

  add_group "Models", "lib/keap/xmlrpc/objects/"
  add_group "Resources", "lib/keap/xmlrpc/client/"
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "keap/xmlrpc"
require "minitest/autorun"
require "minitest/reporters"
require "faraday"

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(color: true)
