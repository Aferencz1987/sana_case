require 'rails_helper'

RSpec.describe 'NPPES NPI registry api' do
  describe 'returns provider information' do
    it 'returns information based on last name and location' do
      VCR.use_cassette 'kemp_location' do
        result = ProviderSearchService.last_name_location("kemp", "co")

        expect(result[:results][0]).to have_key(:basic)
        expect(result[:results][0]).to have_key(:number)
        expect(result[:results][0]).to have_key(:addresses)
        expect(result[:results][0][:basic][:last_name]).to eq("KEMP")
        expect(result[:results][1][:basic][:last_name]).to eq("KEMP")
        expect(result[:results][2][:basic][:last_name]).to_not eq("BART")
      end
    end

    it 'returns information based on last name and first name' do
      VCR.use_cassette 'kemp_laura' do
        result = ProviderSearchService.first_last_name('kemp', 'laura')

        expect(result[:results][0]).to have_key(:basic)
        expect(result[:results][0]).to have_key(:number)
        expect(result[:results][0]).to have_key(:addresses)
        expect(result[:results][0][:basic][:last_name]).to eq("KEMP")
        expect(result[:results][1][:basic][:last_name]).to eq("KEMP")
        expect(result[:results][2][:basic][:last_name]).to_not eq("BART")
      end
    end

    it 'returns information based on last name and specialty' do
      VCR.use_cassette 'co_midwife' do
        result = ProviderSearchService.state_specialty('co', 'midwife')
        expect(result[:results][0][:addresses][0][:state]).to eq("CO")
        expect(result[:results][1][:addresses][0][:state]).to eq("CO")
        expect(result[:results][2][:addresses][0][:state]).to eq("CO")
        expect(result[:results][0][:taxonomies][1][:desc]).to eq("Advanced Practice Midwife")
        expect(result[:results][1][:taxonomies][0][:desc]).to eq("Advanced Practice Midwife")
        expect(result[:results][2][:taxonomies][1][:desc]).to eq("Advanced Practice Midwife")
      end
    end
  end
end
