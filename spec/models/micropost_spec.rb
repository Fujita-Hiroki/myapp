require 'rails_helper'

RSpec.describe Micropost, type: :model do

  let(:user) { create(:user) }
  let(:micropost) { user.microposts.build(understanding: "Lorem ipsum", problem: "Coffee shop" user_id: user.id) }

  describe "Micropost" do
    it "should be valid" do
      expect(micropost).to be_valid
    end
  
    it "should not be valid" do
      micropost.update_attributes(content: "  ", problem: " ", picture: nil, user_id: user.id)
      expect(micropost).to be_invalid
    end
  end

  describe "user_id" do
    it "should be present" do
      micropost.user_id = nil
      expect(micropost).to be_invalid
    end
  end
  
  describe "understanding" do
    it "should be at most 1000 characters" do
      micropost.understanding = "a" * 1000
      expect(micropost).to be_valid
      micropost.understanding = "a" * 1001
      expect(micropost).to be_invalid
    end
  end

  describe "problem" do
    it "should be at most 1000 characters" do
      micropost.problem = "a" * 1000
      expect(micropost).to be_valid
      micropost.problem = "a" * 1001
      expect(micropost).to be_invalid
    end
  end
end
