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
