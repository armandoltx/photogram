class Pic < ApplicationRecord
  belongs_to :user

  scope :by_creation, ->{ order("created_at DESC") }
end
