require 'spec_helper'

describe Shiphawk::Client::Shipment do

  describe 'book_shipment()' do

    before do
      VCR.insert_cassette 'book_shipment'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      data = {
        rate_id: "574a5cce746027f60324fa759693d6f3",
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

  describe 'update_shipment()' do

    before do
      VCR.insert_cassette 'update_shipment'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      data = {
        shipment: {
          to_address_attributes: {
            name: "Jane Doe"
          }
        }
      }
      Shiphawk.update_shipment 1007542, data
    end

    it 'returns a success message' do
      puts subject.response
    end

  end

  # describe 'cancel_shipment()' do
  #
  #   before do
  #     VCR.insert_cassette 'cancel_shipment'
  #   end
  #
  #   after do
  #     VCR.eject_cassette
  #   end
  #
  #   subject do
  #     Shiphawk.cancel_shipment 1007784
  #   end
  #
  #   it 'returns a success message' do
  #     puts subject.response
  #   end
  #
  # end

end
