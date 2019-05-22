class Account < ApplicationRecord
  belongs_to :parts
  belongs_to :computer
end
