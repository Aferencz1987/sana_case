class ProviderSearchFacade
  def self.last_name_location(last_name, state)
    provider_response = ProviderSearchService.last_name_location(last_name, state)
    result = provider_response[:results]
    provider = {
      first_name: result[0][:basic][:first_name],
      last_name: result[0][:basic][:last_name],
      npi_number: result[0][:number],
      specialty: result[0][:taxonomies][0][:desc]
    }

    addresses = {
      address_list: result[0][:addresses]
    }
    ProviderPoro.new(first_name: provider[:first_name],
                     last_name: provider[:last_name],
                     npi_number: provider[:npi_number],
                     specialty: provider[:specialty],
                     addresses: addresses)
  end
end
      #
      # def self.first_last_name(first_name, last_name)
      #   response = conn.get "?first_name=#{first_name}&last_name=#{last_name}&version=2.1"
      #     search_result = JSON.parse(response.body, symbolize_names: true)
      # end
      #
      # def self.last_name_specialty(last_name, specialty)
      #   response = conn.get "?taxonomy_description=#{specialty}&last_name=#{last_name}&version=2.1"
      #     search_result = JSON.parse(response.body, symbolize_names: true)
      # end
