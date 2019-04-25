class Part < ApplicationRecord

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :part, presence: true
  validates :compatability, presence: true, numericality: { greater_than: 0 }
end
