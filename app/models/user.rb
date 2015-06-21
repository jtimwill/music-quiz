class User < ActiveRecord::Base
  has_many :quizzes, -> {order("created_at DESC")}
  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}
end

