require 'rails_helper'

RSpec.describe UsersService do
  let(:users_service) { UsersService.new }
  it 'should inherit from ApiClient' do
    expect(users_service).to be_a ApiClient
  end

  it 'should have a get method' do
    expect(users_service).to respond_to(:get)
  end

  it 'should return an array of users when calling #get' do
    expect(users_service.get).to be_an Array
  end

  describe '#get wit different limit' do
    let(:users_service) { UsersService.new(0, 5) }
    it 'should return an array of 5 users' do
      expect(users_service.get.size).to eq(5)
    end
  end

  describe '#get wit different offset' do
    let(:users_service) { UsersService.new(5, 5) }
    it 'should return an array of 5 users' do
      expect(users_service.get.size).to eq(5)
      expect(users_service.get.first['id']).to eq(6)
    end
  end
end
