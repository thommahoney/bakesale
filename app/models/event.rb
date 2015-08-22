class Event < ActiveRecord::Base
  belongs_to :organization

  has_many :event_products
  has_many :products, through: :event_products
end
