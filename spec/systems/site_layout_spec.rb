require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do 
   
  describe "home layout" do    
    it "contains root link" do
      visit root_path
      expect(page).to have_link 'StudySupport', href: root_path
    end
  
    it "contains about link" do
      visit root_path
      expect(page).to have_link 'StudySupportの詳細へ', href: about_path
    end
    
    it "contains login link" do
      visit root_path
      expect(page).to have_link 'ログイン', href: login_path
    end

    it "contains sigunup link" do
      visit root_path
      expect(page).to have_link '新規登録', href: signup_path
    end
  end
end
  