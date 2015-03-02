class User < ActiveRecord::Base
  has_many :conditions
  has_many :reminders

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :phone, numericality: true

end
