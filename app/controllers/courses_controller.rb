class CoursesController < ApplicationController
  expose :courses, -> { Course.includes(:votes).order(created_at: :desc) }

  def index
    courses
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])

    @proposals =
      @course.proposals.includes(:teacher, :votes).order(created_at: :desc)
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
