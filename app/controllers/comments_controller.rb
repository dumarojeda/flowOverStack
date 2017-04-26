class CommentsController < ApplicationController
   require 'redcarpet/render_strip'
  def new
  end

  def create
    if params.has_key?(:answer_id)
      puts "crea coment answer"*30
      @answer = Answer.find(params[:answer_id])
      @question_id = @answer.question.id
      @question = Question.find(@question_id)
      @comment = @answer.comments.new(comment_params)
    else
      puts "comment question"*30
      @question_id = params[:question_id]
      @question = Question.find(@question_id)
      @comment = @question.comments.new(comment_params)
    end
    if @comment.save
      redirect_to @question
    else
      puts "no crea comment answer"*30
      render "questions/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description).merge(user_id: current_user.id)
  end

  # def create_comment(comment_type, question_id)
  #   validate_comment(comment_type)
  #   redirect_to question_path(question_id)
  # end

  # def validate_comment(comment_type)
  #   # @comment = Comment.new(comment_params)
  #   # @comment.update_attribute(:c_duty, comment_type)

  #   @comment = Comment.new(comment_params)
  #   if @comment.save
  #     @comment.update_attribute(:c_duty, comment_type)
  #   else
  #     render "questions/show"
  #   end
  # end

end
