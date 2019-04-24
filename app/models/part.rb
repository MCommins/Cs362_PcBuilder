class Part < ApplicationRecord

  validates :name, presence: true
  validates :part, presence: true
  validates :compatability, presence: true
end
