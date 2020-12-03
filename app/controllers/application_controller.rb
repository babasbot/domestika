class ApplicationController < ActionController::Base
  before_action :authenticate_teacher

  def authenticate_teacher
    redirect_to new_session_path unless current_teacher
  end

  def current_teacher
    @current_teacher ||= Teacher.find_by(id: session[:current_teacher_id])
  end
  helper_method :current_teacher
end
