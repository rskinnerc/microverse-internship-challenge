class ApiClient
  attr_reader :connection

  def initialize(offset, limit)
    @offset = offset
    @limit = limit
    @connection = create_connection
  end

  def create_connection
    Faraday.new(
      url: 'https://microverse-api-app.herokuapp.com',
      headers: {
        'Authorization' => 'An32iK-eRu17'
      },
      params: {
        limit: @limit,
        offset: @offset
      }
    )
  end
end
