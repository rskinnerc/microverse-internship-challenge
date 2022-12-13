class ApiClient
  def self.connection
    @connection ||= create_connection
  end

  def self.create_connection
    Faraday.new(
      url: 'https://microverse-api-app.herokuapp.com',
      headers: { 
        'Content-Type' => 'application/json', 
        'Accept' => 'application/json',
        'Authorization' => "An32iK-eRu17"
      },
      params: {
        'limit' => 20,
        'offset' => 0
      }
    )
  end
end