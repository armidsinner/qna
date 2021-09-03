class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_question, only: %i[create]
  before_action :load_answer, only: :destroy

  def new; end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to @question
      flash[:notice] = 'Good job!'
    else
      redirect_to @question
      flash[:notice] = 'Oooops something went wrong((('
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    if check_author(@answer)
      @answer.destroy
      redirect_to @answer.question
      flash[:notice] = 'Your answer has been deleted'
    else
      flash[:notice] = 'You are not author to delete this answer'
      redirect_to @answer.question
    end
  end

  private

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def load_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :user_id)
  end

  def check_author(resourse)
    resourse.user_id == current_user.id
  end
end
