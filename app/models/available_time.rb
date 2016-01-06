class AvailableTime < ActiveRecord::Base
  belongs_to :expert  
  has_many :transactions

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end
