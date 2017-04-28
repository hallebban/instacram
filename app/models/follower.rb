class Follower < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "User"

  # Indirect associations

  # Validations

end
