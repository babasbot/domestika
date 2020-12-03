class CoursesController < ApplicationController
  expose :courses, -> { Course.includes(:votes).order(created_at: :desc) }
  expose :course, scope: -> { current_teacher.courses }

  def index
    courses
  end

  def new
    course
  end

  def create
    @course = current_teacher.courses.create(course_params)

    if @course.errors.blank?
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit(:title)
  end
end
