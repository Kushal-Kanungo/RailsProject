class StudentsController < ApplicationController

  before_action :show,

  def index
    @students = Student.all
  end

  def show
    @student
  end


  private

  def set_student
    @student = Student.find(params[:id])
  end

end
