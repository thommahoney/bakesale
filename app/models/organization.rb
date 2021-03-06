class Organization < ActiveRecord::Base
  has_many :products

  has_many :user_organizations
  has_many :users, through: :user_organizations

  has_many :events
end
