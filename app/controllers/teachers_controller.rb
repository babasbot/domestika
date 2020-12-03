class TeachersController < ApplicationController
  expose :teacher

  def new
    teacher
  end

  def create
    if teacher.save
      session[:current_teacher_id] = teacher.id

      redirect_to root_path
    else
      render :new, status: :bad_request
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:email, :name)
  end
end
