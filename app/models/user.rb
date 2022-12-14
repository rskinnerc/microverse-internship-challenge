class User < ApplicationRecord
  validates :external_id, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :status, presence: true
  validates :external_created_at, presence: true
  validates :email, presence: true

  def self.pages(limit = 20)
    (count / limit.to_f).ceil
  end

  def self.paginate(page, limit)
    offset = (page - 1) * limit
    limit(limit).offset(offset)
  end

  def self.filter_by_status(status)
    where(status: status)
  end
end
