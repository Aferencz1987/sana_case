require 'rails_helper'

RSpec.describe 'provider search facade' do
  it 'returns providers' do
    VCR.use_cassette 'last_location_facade' do
      result = ProviderSearchFacade.last_name_location("kemp", "co")
require "pry"; binding.pry
      expect(result.current_forecast.count).to eq(10)
      expect(result.hourly_forecast.count).to eq(8)
      expect(result.daily_forecast.count).to eq(5)
    end
  end
end
