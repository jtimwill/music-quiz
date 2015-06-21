require 'rails_helper'

describe Puzzle do 
  it {should belong_to(:quiz)}

  describe "#correct_answer?" do 
    it "returns true if answer is 1 and first two chars of question are C0" do 
      my_puzzle = Fabricate(:puzzle, question: 'C0', answer: '1')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 2 and first two chars of question are CS" do 
      my_puzzle = Fabricate(:puzzle, question: 'CS', answer: '2')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 2 and first two chars of question are Db" do 
      my_puzzle = Fabricate(:puzzle, question: 'Db', answer: '2')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 3 and first two chars of question are D0" do 
      my_puzzle = Fabricate(:puzzle, question: 'D0', answer: '3')
      expect(my_puzzle.correct_answer?).to be_truthy
    end   

    it "returns true if answer is 4 and first two chars of question are DS" do 
      my_puzzle = Fabricate(:puzzle, question: 'DS', answer: '4')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 4 and first two chars of question are Eb" do 
      my_puzzle = Fabricate(:puzzle, question: 'Eb', answer: '4')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 5 and first two chars of question are E0" do 
      my_puzzle = Fabricate(:puzzle, question: 'E0', answer: '5')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 6 and first two chars of question are F0" do 
      my_puzzle = Fabricate(:puzzle, question: 'F0', answer: '6')
      expect(my_puzzle.correct_answer?).to be_truthy
    end   

    it "returns true if answer is 7 and first two chars of question are FS" do 
      my_puzzle = Fabricate(:puzzle, question: 'FS', answer: '7')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 7 and first two chars of question are Gb" do 
      my_puzzle = Fabricate(:puzzle, question: 'Gb', answer: '7')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 8 and first two chars of question are G0" do 
      my_puzzle = Fabricate(:puzzle, question: 'G0', answer: '8')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 9 and first two chars of question are GS" do 
      my_puzzle = Fabricate(:puzzle, question: 'GS', answer: '9')
      expect(my_puzzle.correct_answer?).to be_truthy
    end   
     
    it "returns true if answer is 9 and first two chars of question are Ab" do 
      my_puzzle = Fabricate(:puzzle, question: 'Ab', answer: '9')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 10 and first two chars of question are A0" do 
      my_puzzle = Fabricate(:puzzle, question: 'A0', answer: '10')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 11 and first two chars of question are AS" do 
      my_puzzle = Fabricate(:puzzle, question: 'AS', answer: '11')
      expect(my_puzzle.correct_answer?).to be_truthy
    end

    it "returns true if answer is 11 and first two chars of question are Bb" do 
      my_puzzle = Fabricate(:puzzle, question: 'Bb', answer: '11')
      expect(my_puzzle.correct_answer?).to be_truthy
    end   

    it "returns true if answer is 12 and first two chars of question are B0" do 
      my_puzzle = Fabricate(:puzzle, question: 'B0', answer: '12')
      expect(my_puzzle.correct_answer?).to be_truthy
    end  

    it "returns false for any other question and char combinations" do 
      my_puzzle = Fabricate(:puzzle, question: 'B0', answer: '11')
      expect(my_puzzle.correct_answer?).to be_falsy
    end  
  end 
end
