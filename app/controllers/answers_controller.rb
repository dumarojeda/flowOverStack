class AnswersController < ApplicationController
  
  def new
  end

  def create
    puts "p"*70
    
    puts "esta es la sesion #{current_user.id}"
    @answer = Answer.create(answer_params)
    # if @answer.save
    #   puts "p"*70  
    #   redirect_to question_path(params[:question_id])
      
    # else
    
    # end
    redirect_to question_path(params[:question_id])
  end

  private
  def answer_params
    # params.require(:answer).permit(:description, :question_id, :user_id).merge(question_id: params[:question_id])
    params.require(:answer).permit(:description).merge(question_id: params[:question_id], user_id: current_user.id)
  end
end
