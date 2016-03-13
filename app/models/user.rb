class User < ActiveRecord::Base
  has_many :events, dependent: :destroy, foreign_key: :creator_id
  has_many :attendings, foreign_key: :attendee_id
  has_many :attended_events, through: :attendings
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..20 }
  validates :password, presence: true, length: { in: 6..20 }
  
  def upcoming_events
		attended_events.where( 'date > ? ', Time.now )
	end

	def previous_events
		attended_events.where( 'date < ? ', Time.now )
	end
end
