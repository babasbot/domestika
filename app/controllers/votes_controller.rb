class VotesController < ApplicationController
  expose :course

  def create
    course.votes.create(voter: current_teacher)

    redirect_to request.referer || root_path
  end

  def destroy
    course.votes.where(voter: current_teacher).destroy_all

    redirect_to request.referer || root_path
  end
end
