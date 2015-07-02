require "rails_helper"

describe "the process of adding a skill" do
  it "adds a new skill" do
    visit skills_path
    click_on "Add skill"
    fill_in "Name", with: "Ruby"
    fill_in "Description", with: "Ruby is my favorite language."
    click_on "Create Skill"
    expect(page).to have_content "Ruby"
  end
end

describe "the process of editing a skill" do
  it "changes a skill's info" do
    test_skill = Skill.create(name: "ruby", description: "Ruby is my favorite language.")
    visit skill_path(test_skill)
    click_on "Edit"
    fill_in "Description", with: "I love ruby!"
    click_on "Update Skill"
    expect(page).to have_content "I love ruby!"
  end
end

describe "the process of deleting a skill" do
  it "removes a skill" do
    test_skill = Skill.create(name: "ruby", description: "Ruby is my favorite language.")
    visit skill_path(test_skill)
    click_on "Delete"
    expect(page).to have_no_content "ruby"
  end
end

describe "the process of adding a project to a skill" do
  it "adds a project" do
    test_skill = Skill.create(name: "ruby", description: "Ruby is my favorite language.")
    visit skill_path(test_skill)
    click_on "Add project"
    fill_in "Name", with: "Poker"
    fill_in "Description", with: "Texas Hold'em game made with Ruby/Sinatra/ActiveRecord"
    fill_in "Github url", with: "https://github.com/bencornelis/poker"
    click_on "Create Project"
    expect(page).to have_content "Poker"
  end
end
