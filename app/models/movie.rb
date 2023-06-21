class Movie < ApplicationRecord
  has_many :bookmarks # one movie has many bookmarks

  validates :title, uniqueness: true, presence: true # title is the name
  validates :overview, presence: true # overview is the description
end
