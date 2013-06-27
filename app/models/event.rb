class Event < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :date, presence: true #will this run first and make
                                  #checking date.present? redundant?
  validate :event_date_cannot_be_in_the_past
  validates :title, uniqueness: true, presence: true
  validates :organizer_name, presence: true
  validates :organizer_email, format: VALID_EMAIL_REGEX

  def event_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
