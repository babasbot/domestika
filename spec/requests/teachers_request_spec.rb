require 'rails_helper'

RSpec.describe TeachersController, type: :request do
  describe 'GET /teachers/new' do
    it do
      get '/teachers/new'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /teachers' do
    subject do
      post '/teachers', params: { teacher: teacher_params }
    end

    context 'with a successful registration' do
      let!(:teacher_params) do
        attributes_for(:teacher).slice(:email, :name)
      end

      it do
        subject

        expect(response).to redirect_to root_path
      end

      it do
        subject

        expect(session).to have_key(:current_teacher_id)
      end

      it do
        expect { subject }.to change(Teacher, :count).by(1)
      end
    end

    context 'with an unsuccessful registration' do
      let!(:teacher_params) do
        { email: create(:teacher).email, name: Faker::Name.name }
      end

      it do
        subject

        expect(response).to have_http_status(:bad_request)
      end

      it do
        subject

        expect(session[:current_teacher_id]).to be_nil
      end

      it do
        expect { subject }.not_to change(Teacher, :count)
      end
    end
  end
end
