require 'rails_helper'

RSpec.describe "UsersSignups", type: :system do

  context "not meet the input conditions" do
    it "is invalid" do
      visit signup_path
      fill_in 'ご自分の名前(またはニックネーム)', with: ''
      fill_in 'メールアドレス', with: 'user@invalid'
      fill_in '半角英数字6文字以上', with: 'foo'
      fill_in 'パスワード(再入力)', with: 'bar'
      click_on '登録する'
      expect(current_path).to eq signup_path
      expect(page).to have_selector '#error_explanation'
      # expect(page).to have_selector 'li', text: '名前を入力してください'
    end
  end

  context "meet the input conditions" do
    it "is valid" do
      visit signup_path
      fill_in 'ご自分の名前(またはニックネーム)', with: 'Example User'
      fill_in 'メールアドレス', with: 'user@example.com'
      fill_in '半角英数字6文字以上', with: 'foobar'
      fill_in 'パスワード(再入力)', with: 'foobar'
      click_on '登録する'
      # follow_redirect!
      expect(current_path).to eq user_path(User.last)
      expect(page).not_to have_selector '#error_explanation'
    end
  end
end
