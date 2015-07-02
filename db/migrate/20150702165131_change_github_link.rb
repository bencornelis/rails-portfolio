class ChangeGithubLink < ActiveRecord::Migration
  def change
    rename_column :projects, :github_link, :github_url
  end
end
