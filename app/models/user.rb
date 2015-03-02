class User < ActiveRecord::Base
  has_many :conditions
  has_many :reminders

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :phone, numericality: true

  def age
	  birthday = self.date_of_birth
	  now = Time.now.utc.to_date
	  now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
	end
end

