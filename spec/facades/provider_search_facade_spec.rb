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

    it 'state and specialty' do
      VCR.use_cassette 'state_specialty_facade' do
        result = ProviderSearchFacade.state_specialty("co", "midwife")
        expect(result[1].specialty.downcase).to eq("advanced practice midwife")
        expect(result[0].address_list[0][:state]).to eq("CO")
      end
    end
  end
end
