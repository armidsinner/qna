class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    if @answer.save
      redirect_to @question
      flash[:notice] = 'Good job!'
    else
      render 'questions/show'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    if current_user.check_author?(@answer)
      @answer.destroy
      flash[:notice] = 'Your answer has been deleted'
      redirect_to @answer.question
    else
      flash[:notice] = 'You are not author to delete this answer'
      render @answer.question
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
