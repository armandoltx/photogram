class Pic < ApplicationRecord
  acts_as_votable # for the gem act_As_votable
  belongs_to :user

  scope :by_creation, ->{ order("created_at DESC") }
end
