class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :attendee_attended_events, foreign_key: :attended_event_id
    has_many :attendees, through: :attendee_attended_events

    validates :name, presence: true, length: { maximum: 50 }
    validates :date, presence: true
    validates :location, presence: true

    scope :upcoming_events, -> { where('date >= ?', Date.today) }
    scope :past_events, -> { where('date < ?', Date.today) }
end
