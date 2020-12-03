require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  describe 'GET /session/new' do
    it do
      get '/session/new'

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /session' do
    subject do
      post '/session', params: { teacher: teacher_params }
    end

    context 'with an existent email' do
      let!(:teacher) do
        create(:teacher)
      end

      let!(:teacher_params) do
        { email: teacher.email }
      end

      it do
        subject

        expect(response).to redirect_to(root_path)
      end

      it do
        subject

        expect(session[:current_teacher_id]).to eq teacher.id
      end
    end

    context 'with an unexistent email' do
      let!(:teacher_params) do
        { email: Faker::Internet.email }
      end

      it do
        subject

        expect(response).to have_http_status(:redirect)
      end

      it do
        subject

        expect(session[:current_teacher_id]).to be_nil
      end
    end
  end

  describe 'DELETE /session' do
    subject do
      delete '/session'
    end

    before do
      login_teacher create(:teacher)
    end

    it do
      subject

      expect(response).to redirect_to(new_session_path)
    end

    it do
      subject

      expect(session[:current_teacher_id]).to be_nil
    end
  end
end
