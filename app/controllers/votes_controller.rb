class VotesController < ApplicationController
  
  def create
    #validar si el usuario ya voto
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      question_id = @answer.question.id
      create_vote(@answer, question_id)    
    else
      question_id = params[:question_id]
      @question = Question.find(params[:question_id])
      create_vote(@question, question_id)
    end
  end

  def destroy
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      @answer.votes.find_by(user_id: current_user.id).destroy
      question_id = @answer.question.id
      redirect_to question_path(question_id)
    else
      @question = Question.find(params[:question_id])
      @question.votes.find_by(user_id: current_user.id).destroy
      redirect_to question_path(params[:question_id])
    end
  end

  private

  def create_vote(vote_type, question_id)
    vote_type.votes.pluck(:user_id).each do |user_id|
      if user_id == current_user.id
        #usuario ya voto
        redirect_to question_path(question_id)
        return
      end
    end
      validate_user_vote(vote_type)
      redirect_to question_path(question_id)
      return 
  end

  def validate_user_vote(vote_type)
    @vote = Vote.new(user_id: current_user.id)
    @vote.update_attribute(:v_duty, vote_type)
  end

end
