class CommentsController < ApplicationController
  
  def new
  end

  def create
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      question_id = @answer.question.id
      create_comment(@answer, question_id)
    else
      question_id = params[:question_id]
      @question = Question.find(question_id)
      create_comment(@question, question_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description).merge(user_id: current_user.id)
  end

  def create_comment(comment_type, question_id)
      validate_user_comment(comment_type)
      redirect_to question_path(question_id)
      
  end

  def validate_user_comment(comment_type)
    @comment = Comment.new(comment_params)
    @comment.update_attribute(:c_duty, comment_type)
  end

end
