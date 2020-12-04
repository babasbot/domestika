class SessionsController < ApplicationController
  skip_before_action :authenticate_teacher, only: %i[new create]

  expose :teacher

  def new
    teacher
  end

  def create
    teacher = Teacher.find_by(email: session_params[:email])

    if teacher.try(:authenticate, session_params[:password])
      session[:current_teacher_id] = teacher.id

      redirect_to root_path
    else
      flash[:alert] =
        'The email and password you entered did not match our records.'

      redirect_to new_session_path
    end
  end

  def destroy
    session[:current_teacher_id] = nil

    redirect_to new_session_path
  end

  private

  def session_params
    params.require(:teacher).permit(:email, :password)
  end
end
