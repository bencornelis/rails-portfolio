require "rails_helper"

describe "adding a post" do
  it "allows an admin to add a post" do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit posts_path
    click_on "New Post"
    fill_in "Title", with: "some title"
    fill_in "Content", with: "content"
    click_on "Create Post"
    expect(page).to have_content "some title"
  end

  it "doesn't allow regular users to add posts" do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit new_post_path
    expect(page).to have_content "You are not authorized to perform this action."
  end
end

describe "deleting a post" do
  it "lets an admin delete a post" do
    post = FactoryGirl.create(:post)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit post_path(post)
    click_on "Delete post"
    expect(page).to have_no_content post.title
  end
end

describe "editing a post" do
  it "lets an admin edit a post" do
    post = FactoryGirl.create(:post)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit post_path(post)
    click_on "Edit post"
    fill_in "Title", with: "new title"
    click_on "Update Post"
    expect(page).to have_content "new title"
  end
end

describe "adding a comment to a post" do
  it "allows signed in users to leave a comment" do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    login_as(user)
    visit posts_path
    click_on post.title
    click_on "Leave a comment"
    fill_in "comment_text", with: "nice post!"
    click_on "Create Comment"
    expect(page).to have_content "nice post!"
  end

  it "redirects users that have not signed in to the sign-in page" do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    visit posts_path
    click_on post.title
    click_on "Leave a comment"
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
