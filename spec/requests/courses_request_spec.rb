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
end
