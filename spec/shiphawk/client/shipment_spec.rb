require 'spec_helper'

describe Shiphawk::Client::Shipment do

  describe 'track_shipment()' do

    before do
      VCR.insert_cassette 'track_shipment'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      data = {
        shipment_id: "1007505",
        callback_url: "http://customer.com/api/shipment_status?api_key=3873"
      }
      Shiphawk.track_shipment data
    end

    it 'returns a success message' do
      subject.response.status.must_equal 'subscribed'
    end

  end

  describe 'shipment_status()' do

    before do
      VCR.insert_cassette 'shipment_status'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      Shiphawk.shipment_status 1007505
    end

    it 'returns the status updates' do
      subject.response.status_updates.must_be_instance_of Array
    end

  end

end
