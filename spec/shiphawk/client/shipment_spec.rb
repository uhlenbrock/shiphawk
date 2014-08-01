require 'spec_helper'

describe Shiphawk::Client::Shipment do

  before do
    VCR.insert_cassette 'shipments'
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
    assert_equal subject.response.status, 'subscribed'
  end

end
