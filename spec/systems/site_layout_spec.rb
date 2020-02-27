require 'rails_helper'

RSpec.describe "SiteLayouts", type: :system do  
  describe "home layout" do    
    it "contains root link" do
      visit root_path
      expect(page).to have_link nil, href: root_path, count: 2
    end
  
    it "contains about link" do
      visit root_path
      expect(page).to have_link 'StudySupportの詳細へ', href: about_path
    end
    
    it "ccontains lohgin link" do
      visit root_path
      expect(page).to have_link 'ログイン', href: '#'
    end

    it "ccontains sigunup link" do
      visit root_path
      expect(page).to have_link '新規登録', href: '#'
    end
  end
end
  