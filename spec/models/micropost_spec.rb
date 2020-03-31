require 'rails_helper'

RSpec.describe Micropost, type: :model do

  let(:user) { create(:user) }
  let(:micropost) { user.microposts.build(content: "Lorem ipsum", user_id: user.id) }

  describe "Micropost" do
    it "should be valid" do
      expect(micropost).to be_valid
    end
  
    it "should not be valid" do
      micropost.update_attributes(content: "  ", picture: nil, user_id: user.id)
      expect(micropost).to be_invalid
    end
  end

  describe "user_id" do
    it "should be present" do
      micropost.user_id = nil
      expect(micropost).to be_invalid
    end
  end
  
  describe "content" do
    it "should be at most 2000 characters" do
      micropost.content = "a" * 2000
      expect(micropost).to be_valid
      micropost.content = "a" * 2001
      expect(micropost).to be_invalid
    end
  end
end
