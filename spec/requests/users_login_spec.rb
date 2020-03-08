require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do

  include SessionsHelper
  let(:user) { create(:user) }

  describe "GET /login" do
    context "invalid login information" do
      it "has a danger flash message" do
        get login_path
        post login_path, params: {
          session: {
            email: "",
            password: ""
          }
        }
        expect(flash[:danger]).to be_truthy
        expect(is_logged_in?).to be_falsey
      end
    end

    context "valid login information" do
      it "has no danger flash message" do
        get login_path
        post login_path, params: {
          session: {
            email: user.email,
            password: user.password
          }
        }
        expect(flash[:danger]).to be_falsey
        expect(is_logged_in?).to be_truthy
      end

      it "succeeds logout" do
        get login_path
        post login_path, params: {
          session: {
            email: user.email,
            password: user.password
          }
        }
        expect(is_logged_in?).to be_truthy
        delete logout_path
        expect(is_logged_in?).to be_falsey
      end
    end
  end
end
