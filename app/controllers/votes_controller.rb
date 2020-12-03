class VotesController < ApplicationController
  expose :votable, model: -> { infer_model }

  def create
    votable.votes.create(voter: current_teacher)

    redirect_to request.referer || root_path
  end

  def destroy
    votable.votes.where(voter: current_teacher).destroy_all

    redirect_to request.referer || root_path
  end

  private

  def infer_model
    request.path.split('/').second&.classify&.constantize
  end
end
