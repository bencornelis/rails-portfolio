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

  it "redirects back when a post is missing a required field" do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit posts_path
    click_on "New Post"
    fill_in "Content", with: "content"
    click_on "Create Post"
    expect(page).to have_content "Unable to add post, try again."
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
  it "allows signed in users to leave a comment", js: true do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    login_as(user)
    visit posts_path
    click_on post.title
    click_on "Leave a comment"
    fill_in "comment_text", with: "nice post!"
    click_on "Create Comment"
    expect(page).to have_content "nice post!"
    expect(page).to have_no_content "Create Comment"
  end

  it "requires the comment to have text", js:true do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    login_as(user)
    visit posts_path
    click_on post.title
    click_on "Leave a comment"
    click_on "Create Comment"
    expect(page).to have_content "Unable to add comment, try again."
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

describe "updating a comment" do
  it "only displays an edit option for the user whose comment it is" do
    post = FactoryGirl.create(:post)
    comment = FactoryGirl.create(:comment)
    post.comments << comment
    user = FactoryGirl.create(:user)
    another_user = FactoryGirl.create(:another_user)
    another_user.comments << comment
    login_as(user)
    visit post_path(post)
    expect(page).to have_no_content "Edit"
  end

  it "allows a user to update a comment they made" do
    post = FactoryGirl.create(:post)
    comment = FactoryGirl.create(:comment)
    post.comments << comment
    user = FactoryGirl.create(:user)
    user.comments << comment
    login_as(user)
    visit post_path(post)
    click_on "Edit"
    fill_in "comment_text", with: "I changed my mind..."
    click_on "Update Comment"
    expect(page).to have_content "I changed my mind..."
  end

  it "lets an admin update any comment" do
    post = FactoryGirl.create(:post)
    comment = FactoryGirl.create(:comment)
    post.comments << comment
    user = FactoryGirl.create(:user)
    user.comments << comment
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit post_path(post)
    click_on "Edit"
    fill_in "comment_text", with: "I changed my mind..."
    click_on "Update Comment"
    expect(page).to have_content "I changed my mind..."
  end
end

describe "deleting a comment" do
  it "allows a user to delete a comment they made" do
    post = FactoryGirl.create(:post)
    comment = FactoryGirl.create(:comment)
    post.comments << comment
    user = FactoryGirl.create(:user)
    user.comments << comment
    login_as(user)
    visit post_path(post)
    click_on "Delete"
    expect(page).to have_content "Comment successfully deleted."
    expect(page).to have_no_content comment.text
  end
end
