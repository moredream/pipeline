require 'spec_helper'

describe User do
  before do
    @user = User.new(username: "Example User", email: "user@example.com",
                     password: "foobar00", password_confirmation: "foobar00")
  end

  subject { @user }

  it { should respond_to(:microposts) }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }
    let!(:m2) { FactoryGirl.create(:micropost, user: user, content: "Bar") }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe "microposts" do
      it { should have_content(m1.content) }
      it { should have_content(m2.content) }
      it { should have_content(user.microposts.count) }
    end
  end

end
