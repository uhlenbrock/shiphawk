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
      rate_id: "3836ec569cc95ffbe66a57467f56b7e6",
      order_email: "test@test.com",
      billing_address: {
        first_name: "Jeff",
        last_name: "Smith",
        address_line_1: "123 Cherry Lane",
        city: "Cincinnati",
        state: "OH",
        zipcode: 45202,
        phone_num: 5135551212
      },
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
    Shiphawk.book_shipment data
  end

  it 'returns shipment id based on quote id' do
    subject.response.shipment_id.must_equal 1007778
  end

end
