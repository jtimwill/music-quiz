class Quiz < ActiveRecord::Base
  belongs_to :user
  has_many :puzzles

  CATEGORIES = ["Treble", "Base", "Both"]
end