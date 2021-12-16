require 'rails_helper'

RSpec.describe 'forecast request' do
  it 'can compile search by provider last name' do
    VCR.use_cassette 'last name 1' do
    location = 'Kemp'

    get "/api/v1/forecast?location=#{location}"

    forecast_result = JSON.parse(response.body, symbolize_names: true)
    expect(forecast_result[:data]).to have_key(:attributes)
    end
  end
end
