require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(external_id: 1, first_name: 'John', last_name: 'Doe', status: 'Active',
                    external_created_at: '2019-06-18T09:08:28.057Z')
    expect(user).to be_valid
  end

  it 'is not valid without a first_name' do
    user = User.new(external_id: 1, last_name: 'Doe', status: 'Active',
                    external_created_at: '2019-06-18T09:08:28.057Z')
    expect(user).to_not be_valid
  end

  it 'is not valid without a last_name' do
    user = User.new(external_id: 1, first_name: 'John', status: 'Active',
                    external_created_at: '2019-06-18T09:08:28.057Z')
    expect(user).to_not be_valid
  end

  it 'is not valid without a status' do
    user = User.new(external_id: 1, first_name: 'John', last_name: 'Doe',
                    external_created_at: '2019-06-18T09:08:28.057Z')
    expect(user).to_not be_valid
  end

  it 'is not valid without a external_created_at' do
    user = User.new(external_id: 1, first_name: 'John', last_name: 'Doe', status: 'Active')
    expect(user).to_not be_valid
  end

  it 'is not valid without a external_id' do
    user = User.new(first_name: 'John', last_name: 'Doe', status: 'Active',
                    external_created_at: '2019-06-18T09:08:28.057Z')
    expect(user).to_not be_valid
  end
end
