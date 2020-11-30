class Day < ApplicationRecord
  has_many :users
  belongs_to :menu
end
