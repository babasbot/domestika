require 'rails_helper'

RSpec.describe CoursesController, type: :request do
  describe 'GET /courses' do
    context 'with a teacher session' do
      before do
        login_teacher create(:teacher)
      end

      it do
        get '/courses'

        expect(response).to have_http_status(:success)
      end
    end

    context 'without a teacher session' do
      it do
        get '/courses'

        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe 'GET /courses/new' do
    context 'with a teacher session' do
      before do
        login_teacher create(:teacher)
      end

      it do
        get '/courses/new'

        expect(response).to have_http_status(:success)
      end
    end

    context 'without a teacher session' do
      it do
        get '/courses/new'

        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe 'POST /courses' do
    context 'with a teacher session' do
      subject do
        post '/courses', params: { course: course_params }
      end

      let(:course_params) do
        attributes_for(:course).slice(:title)
      end

      before do
        login_teacher create(:teacher)
      end

      it do
        expect { subject }.to change(Course, :count).by(1)
      end

      it do
        expect { subject }.to change(Proposal, :count).by(1)
      end

      it do
        subject

        expect(response).to redirect_to(root_path)
      end
    end

    context 'without a teacher session' do
      it do
        expect { subject }.not_to change(Course, :count)
      end

      it do
        expect { subject }.not_to change(Proposal, :count)
      end
    end
  end
end
