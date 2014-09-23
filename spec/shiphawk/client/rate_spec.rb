require 'spec_helper'

describe Shiphawk::Client::Rate do

  describe 'get_rates()' do

    before do
      VCR.insert_cassette 'get_rates'
    end

    after do
      VCR.eject_cassette
    end

    subject do
      data = {
        items: [
          { width: '10', length: '10', height: '10', weight: '10', value: '100', id: '50' },
          { width: '10', length: '10', height: '10', weight: '10', value: '100', id: '1380' }
        ],
        from_zip: '93105',
        to_zip: '93117'
      }
      Shiphawk.get_rates data
    end

    it 'returns rates based on request data' do
      subject.response.first.price.must_equal 31.31
    end

    it 'mashifies the response data' do
      subject.response.first.must_be_instance_of Hashie::Mash
    end

  end

end
