# require 'rails_helper'
#
# RSpec.describe 'provider request' do
#   it 'can compile search by provider last name' do
#     VCR.use_cassette 'last name 1' do
#     provider = 'Kemp'
#
#     get "/api/v1/provider?search=#{provider}"
#
#     provider_result = JSON.parse(response.body, symbolize_names: true)
#     expect(provider_result[:data]).to have_key(:attributes)
#     end
#   end
# end
