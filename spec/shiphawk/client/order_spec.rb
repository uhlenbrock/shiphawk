require 'spec_helper'

describe Shiphawk::Client::Order do

  before do
    VCR.insert_cassette 'orders'
  end

  after do
    VCR.eject_cassette
  end

  subject do
    data = {
      origin_address: {
        first_name: "John",
        last_name: "Smith",
        company: "Twitter, Inc",
        phone_num: "8053352432",
        email: "john@example.com",
        address_line_1: "300 BOYLSTON AVE E",
        city: "Santa Barbara",
        state: "California",
        zipcode: 93106
      },
      destination_address: {
        first_name: "John",
        last_name: "Smith",
        company: "Twitter, Inc",
        phone_num: "8053352432",
        address_line_1: "300 BOYLSTON AVE E",
        city: "Texas City",
        state: "Texas",
        zipcode: 77591
      },
      pickup: [
        {
          start_time: "2015-07-27T04:51:36.645-07:00",
          end_time: "2015-07-27T07:51:36.645-07:00"
        },
        {
          start_time: "2015-07-28T04:51:36.645-07:00",
          end_time: "2015-07-28T07:51:36.646-07:00"
        }
      ]
    }
    Shiphawk.book_shipment '3836ec569cc95ffbe66a57467f56b7e6', data
  end

  it 'returns shipment id and bol based on quote id' do
    assert subject.response.shipment_id
    assert subject.response.bol
  end

end
