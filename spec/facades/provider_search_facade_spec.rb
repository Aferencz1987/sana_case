require 'rails_helper'

RSpec.describe 'provider search facade' do
  describe 'creates provider PORO' do
    it 'last name and location' do
      VCR.use_cassette 'last_location_facade' do
        result = ProviderSearchFacade.last_name_location("kemp", "co")
        expect(result[0].last_name.downcase).to eq("kemp")
      end
    end
    it 'last name and first name' do
      VCR.use_cassette 'full_name_facade' do
        result = ProviderSearchFacade.first_name_last_name("kemp", "laura")
        expect(result[0].last_name.downcase).to eq("kemp")
      end
    end
    it 'last name and specialty' do
      VCR.use_cassette 'last_name_specialty_facade' do
        result = ProviderSearchFacade.last_name_specialty("kemp", "midwife")
        expect(result[0].last_name.downcase).to eq("kemp")
      end
    end
  end
end
