require "rails_helper"

describe "creating an account" do
  it "logs a user in and directs them to the front page of the blog" do
    post = FactoryGirl.create(:post)
    visit posts_path
    click_on "Signup"
    fill_in "Name", with: "bob"
    fill_in "Email", with: "bob@example.com"
    fill_in "Password", with: 12345678
    fill_in "Password confirmation", with: 12345678
    click_on "Sign up"
    expect(page).to have_content post.content
    expect(page).to have_content "Logout"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end

describe "the login process" do
  it "directs the user to the front page of the blog" do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    visit posts_path
    click_on "Login"
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_on "Log in"
    expect(page).to have_content post.content
    expect(page).to have_content "Logout"
    expect(page).to have_content "Signed in successfully."
  end
end
