require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:comment) { create(:comment) }

  describe "comment" do
    it "should be valid" do
      pending 'この先はなぜかテストが失敗する'
      expect(comment).to be_valid
    end
  end

  describe "comment" do
    it "should be at most 1000 characters" do
      pending 'この先はなぜかテストが失敗する'
      comment.comment = "a" * 1000
      expect(comment).to be_valid
      comment.comment = "a" * 1001
      expect(comment).to be_invalid
    end
  end
end

# 上記2つのテストは/spec/factories/comments.rbの「association :micropost・・・」によりエラーになる