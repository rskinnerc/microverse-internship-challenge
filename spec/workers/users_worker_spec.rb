require 'rails_helper'

RSpec.describe UsersWorker, type: :worker do
  it 'should be a Sidekiq worker' do
    expect(described_class).to be < Sidekiq::Worker
  end
end
