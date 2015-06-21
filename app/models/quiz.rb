class Quiz < ActiveRecord::Base
  belongs_to :user
  has_many :puzzles

  CATEGORIES = ["Treble", "Base", "Both"]

  def calculate_score
    puzzles.length
  end

  def self.top_scores
    all.sort_by{|quiz| quiz.score}.reverse.first(5)
  end
end