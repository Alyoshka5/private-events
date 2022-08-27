class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attendee_attended_events, foreign_key: :attendee_id
  has_many :attended_events, through: :attendee_attended_events

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
