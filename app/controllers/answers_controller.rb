class AnswersController < ApplicationController
  
  def new
  end

  def create
    @answer = Answer.create(answer_params)
    redirect_to question_path(params[:question_id])
  end

  private
  def answer_params
    # params.require(:answer).permit(:description, :question_id, :user_id).merge(question_id: params[:question_id])
    params.require(:answer).permit(:description).merge(question_id: params[:question_id], user_id: current_user.id)
  end
end
