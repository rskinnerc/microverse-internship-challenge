class User < ApplicationRecord
  validates :external_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :status, presence: true
  validates :external_created_at, presence: true
end
