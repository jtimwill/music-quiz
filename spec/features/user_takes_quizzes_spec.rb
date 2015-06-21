require 'rails_helper'

feature "User takes quizzes" do 
  scenario "user takes a quiz" do 
    sign_in
    select_quiz("Both")
    
    expect_score_to_eq(0)
    answer_question_correctly(10)
    expect_score_to_eq(10)
    answer_question_incorrectly

    expect_game_over_message("Game Over. Score: 10")
    expect_quizzes_taken(1)

    navigate_to_root_path
    expect_score_to_eq(10)
  end

  def select_quiz(quiz)
    click_button quiz
  end

  def expect_score_to_eq(score)
    expect(page).to have_content("Score: #{score}")
  end

  def find_answer
    question = page.find('img')['src'].last(6).first(2)
    answer_hash = Puzzle::ANSWERS 
    answer = nil

    answer_hash.each do |key, value|
      if question == value[0].upcase || question == value[1]
        answer = key
      end
    end
    answer
  end

  def answer_question_correctly(this_many)
    this_many.times do 
      click_button "Button Number #{find_answer}"
    end
  end

  def answer_question_incorrectly
    answer = find_answer
    if answer == "12"
      answer = 1
    else
      answer = answer.to_i + 1
    end
    click_button "Button Number #{answer}"
  end

  def expect_game_over_message(msg)
    expect(page).to have_content(msg)
  end

  def expect_quizzes_taken(number)
    expect(page).to have_content("Quizzes taken: #{number}")
  end

  def navigate_to_root_path
    click_link "Quizzes"
  end
end



