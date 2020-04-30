class Artist < ApplicationRecord
  has_many :artist_instruments
  has_many :instruments, through: :artist_instruments

  validates :name, presence: true
  validates :age, numericality: true
  validates :title, uniqueness: true
end
