class Appointment < ApplicationRecord
  belongs_to :user

  validates :scheduled_at, uniqueness: true
end
