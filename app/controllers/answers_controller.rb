class AnswersController < ApplicationController
  before_action :load_question, only: %i[new create]

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      # Скорее всего здесь потребуется вывести сообщение об успешном сохранении и снова отрендерить страницу с вопросом
    else
      # А здесь сообщить об ошибках при попытке создания ответа
    end
  end

  private

  def load_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
