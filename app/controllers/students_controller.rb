class StudentsController < ApplicationController
  before_action :set_student, only: %i[edit update show destory]

  def index
    @students = Student.all
  end

  def show; end

  private

  def set_student
    @student = Student.find(params[:id])
  end
end
