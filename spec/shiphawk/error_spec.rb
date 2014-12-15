require 'spec_helper'

describe Shiphawk::Error do

  describe 'unparsable JSON' do

    before do
      VCR.insert_cassette 'search_items_error'
    end

    after do
      VCR.eject_cassette
    end

    it 'raises a Shiphawk::Error' do
      assert_raises Shiphawk::Error do
        Shiphawk.search_items 'table'
      end
    end

  end

  describe 'illegal requests' do

    before do
      VCR.insert_cassette 'book_shipment_error'
    end

    after do
      VCR.eject_cassette
    end

    it 'raises a Shiphawk::Error' do
      assert_raises Shiphawk::Error do
        Shiphawk.book_shipment '100'
      end
    end

  end

end
