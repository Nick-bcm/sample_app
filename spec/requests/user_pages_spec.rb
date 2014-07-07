require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submition" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do
      # Упражнение 8.5
      # before do
      #   fill_in "Name",         with: "Example User"
      #   fill_in "Email",        with: "user@example.com"
      #   fill_in "Password",     with: "foobar"
      #   fill_in "Confirmation", with: "foobar"
      # end
      before { valid_signup }

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: "user@example.com") }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        # Упражнение 8.5
        # it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_success_message('Welcome') }
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end