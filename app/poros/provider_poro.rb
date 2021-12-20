class ProviderPoro
  attr_reader :first_name,
              :last_name,
              :npi_number,
              :specialty,
              :address_list

  def initialize(attributes)
    # require "pry"; binding.pry
    @first_name = attributes[:basic][:first_name]
    @last_name = attributes[:basic][:last_name]
    @npi_number = attributes[:number]
    @specialty = attributes[:taxonomies][0][:desc]
    @address_list = attributes[:addresses]
  end

  def address_list(address_array)

    addresses = {}

    address_array.map do |details|
      addresses[:address_1] = details[:address_1]
      addresses[:address_2] = details[:address_2]
      addresses[:city] = details[:city]
    end
    require "pry"; binding.pry
  end
end
