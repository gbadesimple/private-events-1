class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :location, presence: true
  validates :date, presence: true
end
