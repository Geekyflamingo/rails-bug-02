require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("user@example.com")
  end

  scenario 'Users can register and stay logged in' do

  visit root_path
  click_on "Register"
  expect(page).to have_content("Name")

  fill_in "Name", with: "Betty"
  fill_in "Email", with: "boop@example.com"
  fill_in "Password", with: "boop"
  fill_in "Confirm", with: "boop"
  click_button "Register"
  expect(page).to have_no_content("Register")
  end
end
