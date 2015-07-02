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
    click_on "Edit skill"
    fill_in "Description", with: "I love ruby!"
    click_on "Update Skill"
    expect(page).to have_content "I love ruby!"
  end
end
