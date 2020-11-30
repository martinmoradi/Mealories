class Menu < ApplicationRecord
  belongs_to :user
  has_may :days
end
