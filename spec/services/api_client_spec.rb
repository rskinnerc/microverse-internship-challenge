require 'rails_helper'

RSpec.describe ApiClient do
  let(:api_client) { ApiClient.new(0, 20) }
  it 'should have a connectin instance variable' do
    expect(api_client.connection).to be_a Faraday::Connection
  end

  it 'should have a create connection method' do
    expect(api_client).to respond_to(:create_connection)
  end
end
