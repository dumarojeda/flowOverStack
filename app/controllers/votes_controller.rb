class VotesController < ApplicationController
  
  def create
    #validar si el usuar
    
    @question = Question.find(params[:question_id])
    @question.votes.pluck(:user_id).each do |user_id|
      if user_id == current_user.id
        #usuario ya voto
        redirect_to question_path(params[:question_id])
        return
      end
    end
    validate_user_vote
    redirect_to question_path(params[:question_id])
    
  end

  def destroy
    @question = Question.find(params[:question_id])
    @question.votes.find_by(user_id: current_user.id).destroy
    #@vote = Vote.find(params[:id])
    #@vote.destroy
    redirect_to question_path(params[:question_id])
  end

  private
  def vote_params
    #params.require(:vote).permit(:question_id).merge(user_id: current_user.id)
  end

  def validate_user_vote
    @vote = Vote.new(user_id: current_user.id)
    @vote.update_attribute(:v_duty, @question)
  end

end
