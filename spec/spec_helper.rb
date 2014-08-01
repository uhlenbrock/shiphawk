# Test API Key
ENV['SHIPHAWK_API_KEY'] = '3873c1e7457bedd2ca'

require 'shiphawk'
require 'minitest/autorun'
require 'minispec-metadata'
require 'webmock'
require 'vcr'
require 'minitest-vcr'
require 'faraday'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
MinitestVcr::Spec.configure!

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end
