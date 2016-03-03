require 'rails_helper'

RSpec.feature "User Sessions", type: :feature do
  let!(:user) { User.create(email: email, password: password, password_confirmation: password) }
  let(:email) { 'jill@example.com' }
  let(:password) { 'password' }

  before do
    visit root_path
    within('.navbar') { click_link('Sign in') }
  end

  context "failure" do
    before do
      fill_in("Email", with: email)
      fill_in("user[password]", with: "")
      find_button("Sign in").click
      # try to sign in without a password
    end

    it "displays an error message" do
      expect(page).to have_content("Invalid email or password.")
    end


    # should still see 'Sign in' and 'Sign up'
    # should not see 'Profile' or 'Sign out'
    it "shows the correct navigation links" do
      expect(page).to have_content("Sign in")
      expect(page).to have_content("Sign up")
      expect(page).not_to have_content("Profile")
      expect(page).not_to have_content("Sign out")
    end
  end

  context "success" do
    before do
      fill_in("Email", with: email)
      fill_in("user[password]", with: "password")
      find_button("Sign in").click
      # sign in
    end

    it "displays a welcome message" do
      expect(page).to have_content("Signed in successfully.")
    end

    # should not see 'Sign in' and 'Sign up'
    # should see 'Profile' or 'Sign out'
    it "shows the correct navigation links" do
      expect(page).not_to have_content("Sign in")
      expect(page).not_to have_content("Sign up")
      expect(page).to have_content("Profile")
      expect(page).to have_content("Sign out")
    end
  end
end
