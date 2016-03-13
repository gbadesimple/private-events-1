class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :attendings
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :location, presence: true
  validates :date, presence: true
  
  scope :past, -> { where('date < ? ', Time.now) }
	scope :upcoming, -> { where('date > ? ', Time.now) }
end
