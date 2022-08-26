class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'

    validates :name, presence: true, length: { maximum: 50 }
    validates :date, presence: true
    validates :location, presence: true
end
