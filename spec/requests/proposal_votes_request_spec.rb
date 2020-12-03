require 'rails_helper'

RSpec.describe VotesController, type: :request do
  describe 'POST /proposals/:id/vote' do
    subject do
      post "/proposals/#{proposal.id}/vote"
    end

    let!(:proposal) do
      create(:proposal)
    end

    context 'with a teacher session' do
      let!(:teacher) do
        create(:teacher)
      end

      before do
        login_teacher teacher
      end

      it do
        expect { subject }.to change { proposal.reload.votes.count }.by(1)
      end
    end

    context 'without a session' do
      it do
        expect { subject }.not_to change { proposal.reload.votes.count }
      end
    end
  end
end
