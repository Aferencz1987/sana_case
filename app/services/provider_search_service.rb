class ProviderSearchService

  def self.last_name_location(last_name, state)
    response = conn.get "?number=&enumeration_type=&taxonomy_description=&first_name=&use_first_name_alias=&last_name=#{last_name}&organization_name=&address_purpose=&city=&#{state}=&postal_code=&country_code=&limit=&skip=&version=2.1"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.first_last_name(first_name, last_name)
    response = conn.get "/?number=&enumeration_type=&taxonomy_description=&first_name=#{first_name}&use_first_name_alias=&last_name=#{last_name}&organization_name=&address_purpose=&city=&state=&postal_code=&country_code=&limit=&skip=&version=2.1"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end
  def self.last_name_specialty(last_name, specialty)
    response = conn.get "/?number=&enumeration_type=&taxonomy_description=#{specialty}&first_name=&use_first_name_alias=&last_name=#{last_name}&organization_name=&address_purpose=&city=&state=&postal_code=&country_code=&limit=&skip=&version=2.1"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end
  def self.conn
    Faraday.new(url: 'https://npiregistry.cms.hhs.gov/api/') do |faraday|
    end
  end
end
