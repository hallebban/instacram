class Photo < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  belongs_to :owner,
             :class_name => "User",
             :foreign_key => "user_id"

  # Indirect associations

  # Validations

end
