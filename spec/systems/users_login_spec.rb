require 'rails_helper'

RSpec.describe "Logins", type: :system do

  let(:user) { create(:user) }

  describe "Login" do
    context "invalid login information" do
      it "is invalid" do
        visit login_path
        expect(page).to have_selector '.login-container'
        fill_in 'メールアドレス', with: ''
        fill_in '半角英数字6文字以上', with: ''
        find(".form-submit").click
        expect(current_path).to eq login_path
        expect(page).to have_selector '.login-container'
        expect(page).to have_selector '.alert-danger'
      end

      context "users input invalid information then other links" do
        it "deletes flash messages" do
          visit login_path
          expect(page).to have_selector '.login-container'
          fill_in 'メールアドレス', with: ''
          fill_in '半角英数字6文字以上', with: ''
          find(".form-submit").click
          expect(current_path).to eq login_path
          expect(page).to have_selector '.login-container'
          expect(page).to have_selector '.alert-danger'
          visit root_path
          expect(page).not_to have_selector '.alert-danger'
        end
      end
    end

    context "valid  login information" do
      it "is valid" do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in '半角英数字6文字以上', with: 'password'
        find(".form-submit").click
        expect(current_path).to eq user_path(1)
        expect(page).to have_content 'ログアウト'
        expect(page).to have_content 'プロフィール'
      end

      it "contains logout without login" do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in '半角英数字6文字以上', with: 'password'
        find(".form-submit").click
        expect(current_path).to eq user_path(1)
        expect(page).to have_content 'ログアウト'
        expect(page).to have_content 'プロフィール'
        expect(page).not_to have_content 'ログイン'
      end
    end
  end

  describe "Logout" do
    it "contains logout without login" do
      visit login_path
      fill_in 'メールアドレス', with: user.email
      fill_in '半角英数字6文字以上', with: 'password'
      find(".form-submit").click
      expect(current_path).to eq user_path(1)
      expect(page).to have_content 'ログアウト'
      expect(page).to have_content 'プロフィール'
      expect(page).not_to have_content 'ログイン'
      click_on 'ログアウト'
      expect(current_path).to eq root_path
      expect(page).to have_content 'StudySupportとは'
      expect(page).to have_content 'ログイン'
      expect(page).not_to have_content 'ログアウト'
    end
  end
end
