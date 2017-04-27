class QuestionsController < ApplicationController
  # before_action :authenticate_user!
  # require 'redcarpet'
  require 'redcarpet/render_strip'
  
  before_action :set_markdowm, only: [:show, :create, :new]

  def new
    if user_signed_in?
      @question = Question.new
      render :new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to question_path(@question.id)
    else
      render 'new'
    end
  end

  def index
    @questions = Question.all
    if params[:question].present?
      search = params[:question]
      @questions = @questions.where("description LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%")
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private



  def question_params
    params.require(:question).permit(:name, :description).merge(user_id: current_user.id)
  end
end
