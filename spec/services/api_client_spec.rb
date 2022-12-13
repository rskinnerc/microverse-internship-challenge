require 'rails_helper'

describe ApiClient do
  it 'should have a connectin instance variable' do
    expect(ApiClient.connection).to be_a Faraday::Connection
  end

  it 'should have a create connection method' do
    expect(ApiClient).to respond_to(:create_connection)
  end
end