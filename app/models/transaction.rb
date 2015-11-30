class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :available_time
end
