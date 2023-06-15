class Bookmark < ApplicationRecord
  belongs_to :movie # one bookmark belongs to one movie
  belongs_to :list # one bookmark belongs to one list

  validates :comment, length: { minimum: 6 } # minimum 6 characters
  validates :movie_id, uniqueness: { scope: :list_id } # one movie per list
end
