class AvailableTime < ActiveRecord::Base
  belongs_to :expert  
  has_many :transactions
end
