class Order < ActiveRecord::Base
  belongs_to :user_payment
end
