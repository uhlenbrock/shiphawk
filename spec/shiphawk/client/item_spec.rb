require 'spec_helper'

describe Shiphawk::Client::Item do

  before do
    VCR.insert_cassette 'items'
  end

  after do
    VCR.eject_cassette
  end

  subject do
    Shiphawk.search_items 'table'
  end

  it 'returns items based on search term' do
    assert_equal subject.response.class, Array
    assert ! subject.response.empty?
  end

end
