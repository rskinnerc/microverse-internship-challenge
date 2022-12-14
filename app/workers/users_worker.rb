require 'sidekiq-scheduler'

class UsersWorker
  include Sidekiq::Worker

  def perform(limit = 20)
    if User.all.empty?
      offset = 0
      limit = 100
    else
      offset = User.last[:external_id]
    end
    p "Importing users from offset #{offset} to #{offset + limit}"

    users = UsersService.new(offset, limit).get
    users.each do |user|
      User.find_or_create_by(external_id: user[:id]) do |u|
        u.first_name = user[:first_name]
        u.last_name = user[:last_name]
        u.status = user[:status]
        u.external_created_at = user[:created_at]
        u.email = user[:email]
      end
    end
  end
end
