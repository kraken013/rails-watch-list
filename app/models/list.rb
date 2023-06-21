class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy # une liste a plusieurs bookmarks
  has_many :movies, through: :bookmarks # une liste a plusieurs movies, au travers des bookmarks

  validates :name, uniqueness: true, presence: true # nom unique et obligatoire

  
end
