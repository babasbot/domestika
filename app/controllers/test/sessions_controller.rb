module Test
  class SessionsController < ApplicationController
    skip_before_action :authenticate_teacher

    def create
      session[:current_teacher_id] = params[:teacher_id]
    end
  end
end
