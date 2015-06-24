class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question: @question).order(created_at: :asc)
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question submitted!'
      redirect_to question_path(@question)
    else
      flash[:error] = "Invalid input"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      flash[:notice] = 'Question updated!'
      redirect_to question_path(@question)
    else
      flash[:error] = "Invalid input"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @answers = Answer.where(question: @question)

    @question.delete
    @answers.each do |answer|
      answer.delete
    end

    flash[:notice] = 'Question deleted!'
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
