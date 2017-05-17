class QuestionsController < ApplicationController
  # before_action :authenticate_user!
  # require 'redcarpet'
  require 'uri'

  
  before_action :set_markdowm, only: [:show, :create, :new, :edit, :preview]

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
      @typeEntry = 'qs'
      @entry = @question
      respond_to do |format|
        format.js {render 'answers/errors.js.erb'}
      end
    end
  end

  def preview
    @typeEntry = params[:typeEntry]
    if params[:name].present?
      @title = params[:name]
    else
      @title = ''
    end

    if params[:description].present?
      @description = params[:description]
    else
      @description = ''
    end
    respond_to do |format|
      #format.html
      format.js
    end
  end

  def index
    @questions = Question.order(id: :desc)
    if params[:question].present?
      search = params[:question]
      @questions = @questions.where("description ILIKE ? OR name ILIKE ?", "%#{search}%", "%#{search}%")
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
    render :edit
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:name, :description).merge(user_id: current_user.id)
  end
end
