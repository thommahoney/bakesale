class User < ActiveRecord::Base
  has_many :user_payments

  has_many :user_organizations
  has_many :organizations, through: :user_organizations
end
