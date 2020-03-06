require 'rails_helper'

RSpec.describe "Logins", type: :system do

  let(:user) { create(:user) }

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
      fill_in '半角英数字6文字以上', with: 'foobar'
      find(".form-submit").click
      expect(current_path).to eq user_path(1)
    #   expect(page).to have_selector '.show-container'
    end
  end
end

