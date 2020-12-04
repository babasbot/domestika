class ProposalsController < ApplicationController
  expose :course

  def create
    course.proposals.create(teacher: current_teacher)

    redirect_to request.referer || root_path
  end

  def destroy
    course.proposals.where(teacher: current_teacher).destroy_all

    redirect_to request.referer || root_path
  end
end
