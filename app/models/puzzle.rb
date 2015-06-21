class Puzzle < ActiveRecord::Base
  belongs_to :quiz

  def correct_answer?
    if question[0..1] == ANSWERS[answer].first || question[0..1] == ANSWERS[answer].last
      true
    end
  end

  ANSWERS = {'1' => ['C0'], 
             '2' => ['CS', 'Db'], 
             '3' => ['D0'], 
             '4' => ['DS', 'Eb'], 
             '5' => ['E0'], 
             '6' => ['F0'], 
             '7' => ['FS','Gb'], 
             '8' => ['G0'], 
             '9' => ['GS', 'Ab'], 
             '10' => ['A0'], 
             '11' => ['AS', 'Bb'], 
             '12' => ['B0']}
end

