require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do

  include ApplicationHelpers

  let(:user) { create(:user) }

  describe "#current_user" do
    context "session is nil" do
      it "returns right user" do
        remember(user)
        expect(current_user).to eq user
        expect(is_logged_in?).to be_truthy
      end
    end

    context "remember digest is wrong" do
      it "returns nil" do
        remember(user)
        user.update_attribute(:remember_digest, User.digest(User.new_token))
        expect(current_user).to be_nil
      end
    end
  end
end
