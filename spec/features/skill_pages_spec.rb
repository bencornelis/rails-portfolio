require "rails_helper"

describe "the process of adding a skill" do
  it "lets an admin add a skill" do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit root_path
    click_on "Add skill"
    fill_in "Name", with: "Ruby"
    fill_in "Description", with: "Ruby is my favorite language."
    click_on "Create Skill"
    expect(page).to have_content "Ruby"
  end

  it "redirects back to the form if a field is missing" do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit root_path
    click_on "Add skill"
    fill_in "Description", with: "Ruby is my favorite language."
    click_on "Create Skill"
    expect(page).to have_content "Unable to add skill, try again."
  end

  it "does not let a regular user add a skill" do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit new_skill_path
    expect(page).to have_content "You are not authorized to perform this action."
  end
end

describe "the process of editing a skill" do
  it "lets an admin change a skill's info" do
    skill = FactoryGirl.create(:skill)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit skill_path(skill)
    click_on "Edit"
    fill_in "Description", with: "I love ruby!"
    click_on "Update Skill"
    expect(page).to have_content "I love ruby!"
  end

  it "does not let a regular users edit a skill" do
    skill = FactoryGirl.create(:skill)
    user = FactoryGirl.create(:user)
    login_as(user)
    visit edit_skill_path(skill)
    expect(page).to have_content "You are not authorized to perform this action."
  end
end

describe "the process of deleting a skill" do
  it "lets an admin delete a skill" do
    skill = FactoryGirl.create(:skill)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit skill_path(skill)
    click_on "Delete"
    expect(page).to have_no_content "ruby"
  end
end

describe "the process of adding a project to a skill" do
  it "lets an admin add a project" do
    skill = FactoryGirl.create(:skill)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit skill_path(skill)
    click_on "Add project"
    fill_in "Name", with: "Poker"
    fill_in "Description", with: "Texas Hold'em game made with Ruby/Sinatra/ActiveRecord"
    fill_in "Github url", with: "https://github.com/bencornelis/poker"
    click_on "Create Project"
    expect(page).to have_content "Poker"
  end

  it "redirects back to the form if a field is missing" do
    skill = FactoryGirl.create(:skill)
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit skill_path(skill)
    click_on "Add project"
    fill_in "Name", with: "Poker"
    click_on "Create Project"
    expect(page).to have_content "Unable to add project, try again."
  end
end
