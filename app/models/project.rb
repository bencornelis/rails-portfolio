class Project < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  validates :github_url, :presence => true
  belongs_to :skill
end
