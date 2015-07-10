require "rails_helper"

describe "the process of editing a project" do
  it "lets an admin edit a project" do
    skill = FactoryGirl.create(:skill)
    project = FactoryGirl.create(:project)
    skill.projects << project
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit skill_path(skill)
    click_on "Poker"
    click_on "Edit"
    fill_in "Name", with: "Texas Hold'em"
    click_on "Update Project"
    expect(page).to have_content "Texas Hold'em"
  end

  it "does not let a regular user to edit a project" do
    skill = FactoryGirl.create(:skill)
    project = FactoryGirl.create(:project)
    skill.projects << project
    user = FactoryGirl.create(:user)
    login_as(user)
    visit edit_skill_project_path(skill, project)
    expect(page).to have_content "You are not authorized to perform this action."
  end
end

describe "the process of deleting a project" do
  it "lets an admin remove a project" do
    skill = FactoryGirl.create(:skill)
    project = FactoryGirl.create(:project)
    skill.projects << project
    admin = FactoryGirl.create(:admin)
    login_as(admin)
    visit skill_project_path(skill, project)
    click_on "Delete"
    expect(page).to have_no_content "Poker"
  end
end
