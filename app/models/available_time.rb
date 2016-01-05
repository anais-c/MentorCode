class AvailableTime < ActiveRecord::Base
  belongs_to :expert  
  has_many :transactions

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
