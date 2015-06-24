class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question_id = @question.id
    if @answer.save
      flash[:notice] = 'Answer submitted!'
      redirect_to question_path(@question)
    else
      flash[:error] = "Invalid input"
      render :new
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end
