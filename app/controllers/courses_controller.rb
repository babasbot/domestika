class CoursesController < ApplicationController
  expose :courses, -> { Course.includes(:votes).order(created_at: :desc) }

  def index
    courses
  end
end
