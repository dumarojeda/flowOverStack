class CommentsController < ApplicationController
  
  before_action :set_markdowm, only: [:create, :new, :edit, :show]

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
      if params.has_key?(:answer_id)
        respond_to do |format|
          format.js {render 'comments/createca.js.erb'}
        end
      else
        respond_to do |format|
          format.js {render 'comments/createcq.js.erb'}
        end
      end
      
      # redirect_to @question
    else
      @comment.created_at = Time.now
      @typeEntry = session[:passed_variable]
      @entry = @comment
      respond_to do |format|
        format.js {render 'answers/errors.js.erb'}
      end
      # render "questions/show"
    end
  end

  def edit
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      @question_id = @answer.question.id
      @question = Question.find(@question_id)
      @comment = @answer.comments.find(params[:id])

      render :edit
    else
      @question_id = params[:question_id]
      @question = Question.find(@question_id)
      @comment = @question.comments.find(params[:id])
      render :edit
    end
  end

  def update
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      @question_id = @answer.question.id
      @question = Question.find(@question_id)
      @comment = @answer.comments.find(params[:id])
      @comment.update(comment_params)
      redirect_to question_path(@question_id)
    else
      @question_id = params[:question_id]
      @question = Question.find(@question_id)
      @comment = @question.comments.find(params[:id])
      @comment.update(comment_params)
      redirect_to question_path(@question_id)
    end
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
    respond_to do |format|
      format.js 
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
