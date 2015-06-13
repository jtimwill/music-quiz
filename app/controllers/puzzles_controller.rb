class PuzzlesController < ApplicationController
  # before_action :require_user

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @puzzle = @quiz.puzzles.build(puzzle_params)

    if correct_answer?(@puzzle)
      @quiz.score = calculate_score(@quiz)
      @quiz.save
      flash[:notice] = "Correct!"
      redirect_to @quiz
    else
      @quiz.save
      flash[:danger] = "Game Over. Score: #{@quiz.score}"
      redirect_to user_path(current_user)
    end
  end

  private

  def calculate_score(quiz)
    @score = quiz.puzzles.length
  end

  def correct_answer?(puzzle)
    if puzzle.question.length == 4
      puzzle.question[0..1] == puzzle.answer
    else
      puzzle.question[0] == puzzle.answer
    end
  end

  def times_up?
    false
  end

  def puzzle_params
    params.require(:puzzle).permit(:question, :answer)
  end
end
