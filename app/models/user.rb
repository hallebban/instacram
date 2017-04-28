class User < ApplicationRecord
  # Direct associations

  has_many   :received_follower_requests,
             :class_name => "Follower",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :followers,
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :uploads,
             :class_name => "Photo",
             :dependent => :destroy

  # Indirect associations

  has_many   :subscribers,
             :through => :received_follower_requests,
             :source => :sender

  has_many   :leaders,
             :through => :followers,
             :source => :recipient

  has_many   :favorites,
             :through => :likes,
             :source => :photo

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
