class ChangeProjectsSkills < ActiveRecord::Migration
  def change
    drop_table :projects_skills
    add_column :projects, :skill_id, :integer
  end
end
