class Post < ApplicationRecord
  belongs_to :user
  acts_as_votable
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 100} # Questions are capped at 100 chars.
  default_scope { order(cached_votes_score: :DESC) }

 

  
end
