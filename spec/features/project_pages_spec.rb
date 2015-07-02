require "rails_helper"

describe "the process of editing a project" do
  it "edits a project" do
    test_skill = Skill.create(name: "ruby", description: "Ruby is my favorite language.")
    test_skill.projects.create(name: "Poker",
                               description: "Texas Hold'em game made with Ruby/Sinatra/ActiveRecord",
                               github_url: "https://github.com/bencornelis/poker")
    visit skill_path(test_skill)
    click_on "Poker"
    click_on "Edit"
    fill_in "Name", with: "Texas Hold'em"
    click_on "Update Project"
    expect(page).to have_content "Texas Hold'em"
  end
end

describe "the process of deleting a project" do
  it "removes a project" do
    test_skill   = Skill.create(name: "ruby", description: "Ruby is my favorite language.")
    test_project = test_skill.projects.create(name: "Poker",
                                              description: "Texas Hold'em game made with Ruby/Sinatra/ActiveRecord",
                                              github_url: "https://github.com/bencornelis/poker")
    visit skill_project_path(test_skill, test_project)
    click_on "Delete"
    expect(page).to have_no_content "Poker"
  end
end
