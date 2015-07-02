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
