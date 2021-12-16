require 'rails_helper'

RSpec.describe 'NPPES NPI registry api' do
  it 'returns provider information' do
    VCR.use_cassette 'kemp' do
      result = ProviderSearchService.last_name_location('kemp', 'co')
require "pry"; binding.pry
      expect(result).to have_key(:lon)
      expect(result).to have_key(:lat)
      expect(result).to_not have_key(:minutely)
      expect(result[:current]).to have_key(:temp)
      expect(result[:hourly].first).to have_key(:temp)
      expect(result[:daily].first).to have_key(:temp)
      expect(result[:current][:temp]).to eq(90.81)
    end
  end
end
