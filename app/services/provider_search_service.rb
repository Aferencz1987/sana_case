class ProviderSearchService

  def self.last_name_location(last_name, state)
    response = conn.get "?last_name=#{last_name}&state=#{state}&version=2.1"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.first_last_name(last_name, first_name)
    response = conn.get "?first_name=#{first_name}&last_name=#{last_name}&version=2.1"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  # def self.last_name_specialty(last_name, specialty)
  #   response = conn.get "?taxonomy_description=#{specialty}&last_name=#{last_name}&version=2.1"
  #     search_result = JSON.parse(response.body, symbolize_names: true)
  # end

  def self.state_specialty(state, specialty)
    response = conn.get "?taxonomy_description=#{specialty}&state=#{state}&version=2.1"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://npiregistry.cms.hhs.gov/api/') do |faraday|
    end
  end
end
