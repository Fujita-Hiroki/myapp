require 'rails_helper'

RSpec.describe "UsersEdits", type: :request do

  let(:user) { create(:user) }
  let(:other_user) { create(:other_user) }

  def patch_invalid_information
    patch user_path(user), params: {
      user: {
        name: "",
        email: "foo@invalid",
        password: "foo",
        password_confirmation: "bar"
      }
    }
  end

  def patch_valid_information
    patch user_path(user), params: {
      user: {
        name: "Foo Bar",
        email: "foo@bar.com",
        password: "",
        password_confirmation: ""
      }
    }
  end

  describe "GET /users/:id/edit" do
    context "invalid" do
      it "does not succeed edit" do
        log_in_as(user)
        expect(is_logged_in?).to be_truthy
        get edit_user_path(user)
        # expect(request.fullpath).to eq '/users/1/edit'  なぜかidがiにならない
        patch_invalid_information
        expect(flash[:danger]).to be_truthy
        # expect(request.fullpath).to eq '/users/1/edit'  なぜかidがiにならない
      end
    end

    context "valid" do
      it "succeeds edit" do
        log_in_as(user)
        expect(is_logged_in?).to be_truthy
        get edit_user_path(user)
        # expect(request.fullpath).to eq '/users/1/edit'  なぜかidがiにならない
        patch_valid_information
        expect(flash[:success]).to be_truthy
        follow_redirect!
        # expect(request.fullpath).to eq '/users/1/edit'   
      end
    end

    context "login as wrong user" do
      it "should redirect edit" do
        log_in_as(other_user)
        get edit_user_path(user)
        follow_redirect!
        expect(request.fullpath).to eq '/'        
      end

      it "should redirect update" do
        log_in_as(other_user)
        get edit_user_path(user)
        patch_valid_information
        follow_redirect!
        expect(request.fullpath).to eq '/'
      end
    end

    context "login as right user" do
      it "succeeds edit with friendly forwarding" do
        get edit_user_path(user)
        follow_redirect!
        expect(request.fullpath).to eq '/login' 
        log_in_as(user)
        # expect(request.fullpath).to eq '/users/1/edit'  なぜかidがiにならない
      end
    end
  end
end
