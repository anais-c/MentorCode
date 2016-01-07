class AvailableTime < ActiveRecord::Base
  belongs_to :expert  
  has_many :transactions, dependent: :destroy

  validate :date_cannot_be_in_the_past
  validate :end_after_start
  
  validates :date, presence: true

  validates :start_time, presence: true
  validates :end_time, presence: true


  private

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def end_after_start
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_date, "must be after the start date")
    end
  end

end
