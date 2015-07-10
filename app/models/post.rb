class Post < ActiveRecord::Base

  has_many :comments

  def self.sort
    all.order("id DESC")
  end

  def self.newest
    sort.first
  end

  def self.most_recent(num_posts)
    sort.limit(num_posts)[1..-1]
  end

  def posted_at
    created_at.strftime("%d %b %Y")
  end

  def time_since_updated
    Time.now - updated_at
  end
end
