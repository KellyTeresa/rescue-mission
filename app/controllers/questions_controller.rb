class QuestionsController < ActionController::Base
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
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
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
