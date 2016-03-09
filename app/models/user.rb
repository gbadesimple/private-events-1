class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..20 }
  validates :password, presence: true, length: { in: 6..20 }
end
