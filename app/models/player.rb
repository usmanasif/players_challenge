class Player < ApplicationRecord
  GENDER_OPTIONS = ['male', 'female', 'non-binary']
  has_one :device
end
