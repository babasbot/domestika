class VotesController < ApplicationController
  expose :course

  def create
    course.votes.create(voter: current_teacher)

    redirect_to request.referer || root_path
  end
end
