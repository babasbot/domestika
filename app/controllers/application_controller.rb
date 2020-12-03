class ApplicationController < ActionController::Base
  def current_teacher
    @current_teacher ||= Teacher.find_by(id: session[:current_teacher_id])
  end
  helper_method :current_teacher
end
