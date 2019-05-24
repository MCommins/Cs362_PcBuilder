class Account < ApplicationRecord
  has_many :parts
  has_many :computers
end
