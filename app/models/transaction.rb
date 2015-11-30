class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :available_time
  has_one :expert, through: :available_times
end
