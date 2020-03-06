require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do

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
      end
    end
  end
end
