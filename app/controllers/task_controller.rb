class TaskController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_handeler
  protect_from_forgery with: :null_session


  def create
    task_data = params.permit(:title, :description, :status, :priority)
    @task = Task.new(task_data)
    if @task.save
      render json: {status: true}
    else
      render json: {status: false}
    end
  end

  def index
    @tasks = Task.all
    render json: @tasks
  end

  def show
    @task = Task.find(params[:id])
    render json: @task
  end

  private 
  def not_found_handeler 
    render json: { error: 'Article not found!' }, status: :not_found
  end

end
