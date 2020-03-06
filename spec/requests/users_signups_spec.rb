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
              password: "foo",
              password_confirmation: "bar"
            }
          }
        }.not_to change(User, :count)
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
              password: "foobar",
              password_confirmation: "foobar"
            }
          }
        }.to change(User, :count).by(1)
      end
    end
  end
end
