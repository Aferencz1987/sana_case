require 'rails_helper'

RSpec.describe 'provider search facade' do
  it 'returns providers' do
    VCR.use_cassette 'last_location_facade' do
      result = ProviderSearchFacade.last_name_location("kemp", "co")
      require "pry"; binding.pry
      expect(result.last_name).to eq("kemp")
    end
  end
end
