class User < ActiveRecord::Base
  has_many :conditions
  has_many :reminders
end