class User < ActiveRecord::Base
  has_many :events, dependent: :destroy, foreign_key: :creator_id
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..20 }
  validates :password, presence: true, length: { in: 6..20 }
end
