require 'rails_helper'

RSpec.describe ProposalsController, type: :request do
  describe 'POST /courses/:id/proposal' do
    subject do
      post "/courses/#{course.id}/proposal"
    end

    let!(:course) do
      create(:course)
    end

    context 'with a teacher session' do
      let!(:teacher) do
        create(:teacher)
      end

      before do
        login_teacher teacher
      end

      it do
        expect { subject }.to change { course.reload.proposals.count }.by(1)
      end

      it do
        expect { subject }.to change { teacher.reload.proposals.count }.by(1)
      end
    end

    context 'without a session' do
      it do
        expect { subject }.not_to change { course.reload.proposals.count }
      end
    end
  end
end
