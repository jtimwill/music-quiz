class PuzzlesController < ApplicationController
  before_action :require_user

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @puzzle = @quiz.puzzles.build(puzzle_params)

    if @puzzle.correct_answer?
      @quiz.score = @quiz.calculate_score
      @quiz.save
      redirect_to @quiz
    else
      @quiz.save
      flash[:danger] = "Game Over. Score: #{@quiz.score}"
      redirect_to user_path(current_user)
    end
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:question, :answer)
  end
end
