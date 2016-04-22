require 'rails_helper'

RSpec.feature "registered user can edit account" do
  include FeatureHelper
  context "with valid params" do
    scenario "they see a form to edit account" do
      user = create(:user)

      user_login

      expect(current_path).to eq(packages_path)
      visit '/dashboard'
      click_on "Edit My Account"

      # within ".edit_form" do
        fill_in "Email", with: "JonBNasty@nasty.com"
        fill_in "Password", with: "password1"
        fill_in "Password confirmation", with: "password1"
        click_on "Edit Account"
      # end
      expect(page).to have_content "JonBNasty@nasty.com"
      expect(page).not_to have_content "email@email.com"
    end
  end

  xcontext "with invalid params as an admin" do
    xscenario "they see an error message" do
      user = create(:user)

      visit '/login'
      click_on "Login"

      expect(current_path).to eq(login_path)
      within ".login_form" do
        fill_in "Username", with: "User"
        fill_in "Password", with: "password1"
        click_on "Sign In"
      end
      expect(current_path).to eq(login_path)
      expect(page).to have_content "Incorrect email/password combination."
      expect(page).to_not have_link "Logout", logout_path
    end
  end

  xcontext "as a guest" do
    xscenario "they see an error message" do
      user = create(:user)

      visit '/login'
      click_on "Login"

      expect(current_path).to eq(login_path)
      within ".login_form" do
        fill_in "Username", with: "Userzz"
        fill_in "Password", with: "password"
        click_on "Sign In"
      end
      expect(current_path).to eq(login_path)
      expect(page).to have_content "Incorrect email/password combination."
      expect(page).to_not have_link "Logout", logout_path
    end
  end

end
