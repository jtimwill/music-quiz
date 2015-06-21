class QuizzesController < ApplicationController
  before_action :require_user, only: [:show, :create]
  before_action :set_quiz, only: [:show]

  def index
    @quiz = Quiz.new
    @quizzes = Quiz.all
  end

  def show
    @puzzle = Puzzle.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user = current_user
    @quiz.save
    render :show
  end

  private 

  def quiz_params
    params.require(:quiz).permit(:category, :score)
  end 

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end