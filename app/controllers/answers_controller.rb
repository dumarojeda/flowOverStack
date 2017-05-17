class AnswersController < ApplicationController
  require 'redcarpet/render_strip'
  before_action :set_markdowm, only: [:create, :show, :edit, :new]

  
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    if @answer.save
      #redirect_to question_path(params[:question_id])
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render 'errors.js.erb'}
      end
    end
  end

  def edit 
    @answer = Answer.find(params[:id]) 
    @question = Question.find(params[:question_id])
    render "answers/edit"
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    redirect_to question_path(params[:question_id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(params[:question_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:description).merge(question_id: params[:question_id], user_id: current_user.id)
  end
end
