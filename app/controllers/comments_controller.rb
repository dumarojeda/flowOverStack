class CommentsController < ApplicationController
  
  before_action :set_markdowm, only: [:create, :new]

  def new
  end

  def create
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      @question_id = @answer.question.id
      @question = Question.find(@question_id)
      @comment = @answer.comments.new(comment_params)
    else
      @question_id = params[:question_id]
      @question = Question.find(@question_id)
      @comment = @question.comments.new(comment_params)
    end
    if @comment.save
      redirect_to @question
    else
      @comment.created_at = Time.now
      render "questions/show"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      @question_id = @answer.question.id
      @question = Question.find(@question_id)
      @comment = @answer.comments.find(params[:id])
      @comment.destroy
    else
      @question_id = params[:question_id]
      @question = Question.find(@question_id)
      @comment = @question.comments.find(params[:id])
      @comment.destroy
    end
    redirect_to @question

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
