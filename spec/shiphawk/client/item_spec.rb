require 'spec_helper'

describe Shiphawk::Client::Item do

  describe 'search_items()' do

    before do
      VCR.insert_cassette 'search_items'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      Shiphawk.search_items 'table'
    end

    it 'returns shiphawk items based on search term' do
      subject.response.must_be_instance_of Array
      subject.response.wont_be_empty
    end

  end

  describe 'get_item()' do

    before do
      VCR.insert_cassette 'get_item'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      Shiphawk.get_item 2071
    end

    it 'returns details for a given shiphawk item id' do
      subject.response.name.must_equal 'Table Lamp w/o bulb'
    end

  end

  describe 'suggest_item()' do

    before do
      VCR.insert_cassette 'suggest_item'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      data = {
        name: "A box",
        width: 10,
        height: 10,
        length: 10,
        value: 100,
        width: 10
      }
      Shiphawk.suggest_item data
    end

    it 'returns details for a given shiphawk item id' do
      subject.response.success.must_equal true
    end

  end

end
