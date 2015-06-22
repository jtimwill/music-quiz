require 'rails_helper'

describe Quiz do 
  it {should belong_to(:user)}
  it {should have_many(:puzzles)}


  describe "#calculate_score" do 
    it "returns the number of puzzles associated with a quiz" do 
      my_quiz = Fabricate(:quiz)
      Fabricate.times(3, :puzzle, quiz_id: my_quiz.id)
      expect(my_quiz.calculate_score).to eq(3)
    end

    it "returns zero if not videos are associated with a quiz" do 
      my_quiz = Fabricate(:quiz)
      expect(my_quiz.calculate_score).to eq(0)
    end
  end

  describe "top_scores" do 
    it "returns the 5 quizzes with the highest scores" do
      quiz1 = Fabricate(:quiz, score: 1)
      quiz2 = Fabricate(:quiz, score: 2)
      quiz3 = Fabricate(:quiz, score: 3)
      quiz4 = Fabricate(:quiz, score: 4)
      quiz5 = Fabricate(:quiz, score: 5)
      quiz6 = Fabricate(:quiz, score: 6)
      expect(Quiz.top_scores).to eq([quiz6,quiz5,quiz4,quiz3,quiz2])
    end

    it "returns the all of the quizzes if less than 5 exist" do
      quiz1 = Fabricate(:quiz, score: 1)
      quiz2 = Fabricate(:quiz, score: 2)
      quiz3 = Fabricate(:quiz, score: 3)
      quiz4 = Fabricate(:quiz, score: 4)
      expect(Quiz.top_scores).to eq([quiz4,quiz3,quiz2,quiz1])
    end
  end
end

