require 'spec_helper'

describe Shiphawk, 'Shiphawk Version' do

  subject { Shiphawk }

  it 'returns a version number from a constant' do
    subject::VERSION.must_equal '0.0.1'
  end

end
