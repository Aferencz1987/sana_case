class ProviderSearchFacade
  def self.last_name_location(last_name, state)
    provider_response = ProviderSearchService.last_name_location(last_name, state)
    result = provider_response[:results]

    result.map do |provider_info|
      ProviderPoro.new(provider_info)
    end
  end

  def  self.first_name_last_name(first_name, last_name)
    provider_response = ProviderSearchService.first_last_name(first_name, last_name)
    result = provider_response[:results]

    result.map do |provider_info|
      ProviderPoro.new(provider_info)
    end
  end

  def self. last_name_specialty(last_name, specialty)
     provider_response = ProviderSearchService.last_name_specialty(last_name, specialty)
     result = provider_response[:results]

     result.map do |provider_info|
       ProviderPoro.new(provider_info)
     end
  end
end
