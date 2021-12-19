class ProviderPoro
  attr_reader :first_name,
              :last_name,
              :npi_number,
              :specialty,
              :address_list

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @npi_number = attributes[:npi_number]
    @specialty = attributes[:specialty]
    @address_list = attributes[:address_list]
  end
end
