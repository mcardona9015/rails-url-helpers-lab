class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = set_student

  end

  def activate

    set_student.active ? set_student.update(active: false) : set_student.update(active: true)

    redirect_to "/students/#{set_student.id}"
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end