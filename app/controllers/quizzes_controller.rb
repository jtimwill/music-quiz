class QuizzesController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :set_quiz, only: [:show]

  def index
    @quiz = Quiz.new
    all_quizzes = Quiz.all.sort_by{|quiz| quiz.score}.reverse
    @top_quizzes = all_quizzes.first(10)
  end

  def show
    @puzzle = Puzzle.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user

    if @quiz.save
      render :show
    else
      render :new
    end
  end

  private 

  def quiz_params
    params.require(:quiz).permit(:category, :score)
  end 

  def set_quiz
    @quiz = Quiz.last
  end
end