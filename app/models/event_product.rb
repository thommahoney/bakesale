class EventProduct < ActiveRecord::Base
  belongs_to :event
  belongs_to :product
end
