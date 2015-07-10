class Comment < ActiveRecord::Base
  validates :text, presence: true
  belongs_to :user
  belongs_to :post

  def commented_at
    created_at.strftime("%d %b %Y")
  end

  def time_since_updated
    Time.now - updated_at
  end
end
