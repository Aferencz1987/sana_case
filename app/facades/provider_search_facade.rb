class ProviderSearchFacade
  def self.last_name_location(last_name, state)
    provider_response = ProviderSearchService.last_name_location(last_name, state)
    provider_response[:results].map do |provider_info|
      attributes =
      {
        first_name: provider_info[:basic][:first_name],
        last_name: provider_info[:basic][:last_name],
        npi_number: provider_info[:number],
        specialty: provider_info[:taxonomies][0][:desc],
        address_list: provider_info[:addresses].map do |addresses|
          {
            address_1: addresses[:address_1],
            address_2: addresses[:address_2],
            city: addresses[:city],
            state: addresses[:state]
          }
        end
      }
      ProviderPoro.new(attributes)
    end
  end

  def  self.first_name_last_name(last_name, first_name)
    provider_response = ProviderSearchService.first_last_name(last_name, first_name)
    provider_response[:results].map do |provider_info|
      attributes =
      {
        first_name: provider_info[:basic][:first_name],
        last_name: provider_info[:basic][:last_name],
        npi_number: provider_info[:number],
        specialty: provider_info[:taxonomies][0][:desc],
        address_list: provider_info[:addresses].map do |addresses|
          {
            address_1: addresses[:address_1],
            address_2: addresses[:address_2],
            city: addresses[:city],
            state: addresses[:state]
          }
        end
      }
      ProviderPoro.new(attributes)
    end
  end

  # def self.last_name_specialty(last_name, specialty)
  #    provider_response = ProviderSearchService.last_name_specialty(last_name, specialty)
  #    provider_response[:results].map do |provider_info|
  #      attributes =
  #      {
  #        first_name: provider_info[:basic][:first_name],
  #        last_name: provider_info[:basic][:last_name],
  #        npi_number: provider_info[:number],
  #        specialty: provider_info[:taxonomies][0][:desc],
  #        address_list: provider_info[:addresses].map do |addresses|
  #          {
  #            address_1: addresses[:address_1],
  #            address_2: addresses[:address_2],
  #            city: addresses[:city],
  #            state: addresses[:state]
  #          }
  #        end
  #      }
  #      ProviderPoro.new(attributes)
  #    end
  # end

  def self.state_specialty(state, specialty)
     provider_response = ProviderSearchService.state_specialty(state, specialty)
     provider_response[:results].map do |provider_info|
       attributes =
       {
         first_name: provider_info[:basic][:first_name],
         last_name: provider_info[:basic][:last_name],
         npi_number: provider_info[:number],
         specialty: provider_info[:taxonomies][0][:desc],
         address_list: provider_info[:addresses].map do |addresses|
           {
             address_1: addresses[:address_1],
             address_2: addresses[:address_2],
             city: addresses[:city],
             state: addresses[:state]
           }
         end
       }
       ProviderPoro.new(attributes)
     end
  end
end
