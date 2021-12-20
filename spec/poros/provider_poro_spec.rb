require 'rails_helper'

RSpec.describe 'Provider poro' do
   it 'has attributes of a provider' do
    attributes = {first_name: "first name test",
                  last_name: "last name test",
                  npi_number: 1234567,
                  specialty: "doctoring",
                  address_list: {address_1: "7720 S BROADWAY", address_2: "STE 590", city: "LITTLETON", state: "CO"}
                 }

    provider = ProviderPoro.new(attributes)

    expect(provider.first_name).to eq(attributes[:first_name])
    expect(provider.specialty).to be_a String
    require "pry"; binding.pry
  end
end
