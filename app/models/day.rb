class Day < ApplicationRecord
  has_many :users
  has_many :menus
end
