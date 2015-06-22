class Quiz < ActiveRecord::Base
  belongs_to :user
  has_many :puzzles

  CATEGORIES = ["Treble", "Base", "Both"]

  def calculate_score
    puzzles.length
  end

  def self.top_scores
    order(score: :desc).limit(5)
  end
end