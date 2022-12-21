class UsersService < ApiClient
  def initialize(offset = 0, limit = 20)
    super(offset, limit)
  end

  def get
    response = @connection.get('/users')
    JSON.parse(response.body, { symbolize_names: true })
  end
end
