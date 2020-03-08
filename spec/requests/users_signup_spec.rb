require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  
  describe "GET /signup" do
    context "invalid signup information" do
      it "is invalid" do
        get signup_path
        expect{ 
          post signup_path, params: {
            user: {
              name:  "",
              email: "user@invalid",
              password: "pass",
              password_confirmation: "word"
            }
          }
        }.not_to change(User, :count)
        expect(is_logged_in?).to be_falsey
      end
    end

    context "valid signup information" do
      it "is valid" do
        get signup_path
        expect{
          post signup_path, params: {
            user: {
              name: "Example User",
              email: "user@example.com",
              password: "password",
              password_confirmation: "password"
            }
          }
        }.to change(User, :count).by(1)
        expect(is_logged_in?).to be_truthy
      end
    end
  end
end
