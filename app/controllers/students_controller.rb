class StudentsController < ApplicationController
  before_action :set_student, only: %i[edit update show destory]

  def index
    @students = Student.all
  end

  def show; end

  def create
    @student = Student.new(student_params)
    @student.save
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
  end

  def destroy
    @student.destroy
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :age)
  end
end
