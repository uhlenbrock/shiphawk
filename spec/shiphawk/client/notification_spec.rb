require 'spec_helper'

describe Shiphawk::Client::Notification do

  describe "publish_catalog_sale()" do

    before do
      VCR.insert_cassette 'notifications'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      data = {
        sale_xid: "14CIN001",
        start_date: "20141101",
        end_date: "20141106",
        pickup_date: "20141108",
        pickup_time: {
          start_time: "2014-11-06 10:00:00",
          end_time: "2014-11-06 14:00:00"
        },
        address_line_1: "address_line_1",
        address_line_2: "address_line_2",
        phone_num: "8055551212",
        city: "Cincinnati",
        state: "OH",
        zipcode: 45202,
        items: [
          {
            name: "item 1",
            category: "category name",
            item_id: 3497,
            description: "description",
            xid: "14CIN10-999",
            image: "image path 1",
            height: "10.0",
            length: "10.0",
            weight: 6.25,
            width: "10.0"
          },
          {
            name: "item 2",
            category: "another category name",
            item_id: 3497,
            description: "description",
            xid: "14-CIN12-999",
            image: "image path 2",
            height: "10.0",
            length: "10.0",
            weight: 6.25,
            width: "10.0"
          }
        ]
      }
      Shiphawk.publish_catalog_sale data
    end

    it 'returns a catalog sale id when publishing sale data' do
      subject.response.catalog_sale_id.must_equal 3
    end

  end

  describe "update_catalog_sale()" do

    before do
      VCR.insert_cassette 'notifications_update'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      sale_xid = "14CIN001"
      data = {
        pickup_time: {
          start_time: "2015-06-18 10:00:00",
          end_time: "2015-06-18 14:00:00"
        }
      }
      Shiphawk.update_catalog_sale sale_xid, data
    end

    it 'returns success when updating the pickup times' do
      subject.response.success.must_equal true
    end

  end

end
