require 'spec_helper'

describe Shiphawk::Client::Rate do

  before do
    VCR.insert_cassette 'rates'
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
      to_zip: '93117',
      rate_filter: 'min_rate'
    }
    Shiphawk.get_rates data
  end

  it 'returns rates based on request data' do
    assert_equal subject.response.price, 31.31
  end

  it 'mashifies the response data' do
    assert_equal subject.response.class, Hashie::Mash
  end

end
