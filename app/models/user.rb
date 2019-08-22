class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
  validates :name, presence: true
  validates :email, presence: true
  validates :email, length: { maximum: 255 } ,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: { case_sensitive: false }
end
