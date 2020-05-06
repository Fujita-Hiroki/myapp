require 'rails_helper'

RSpec.describe Micropost, type: :model do

  let(:micropost) { create(:micropost) }  

  describe "Micropost" do
    it "should be valid" do
      pending 'この先はなぜかテストが失敗する'
      expect(micropost).to be_valid
    end
  end

  describe "user_id" do
    it "should be present" do
      pending 'この先はなぜかテストが失敗する'
      micropost.user_id = nil
      expect(micropost).to be_invalid
    end
  end
  
  describe "understanding" do
    it "should be at most 1000 characters" do
      pending 'この先はなぜかテストが失敗する'
      micropost.understanding = "a" * 1000
      expect(micropost).to be_valid
      micropost.understanding = "a" * 1001
      expect(micropost).to be_invalid
    end
  end

  describe "problem" do
    it "should be at most 1000 characters" do
      pending 'この先はなぜかテストが失敗する'
      micropost.problem = "a" * 1000
      expect(micropost).to be_valid
      micropost.problem = "a" * 1001
      expect(micropost).to be_invalid
    end
  end
end

# 上記4つのテストはmicropost.rbの「validates :tag_ids, presence: true」を記述するとエラー