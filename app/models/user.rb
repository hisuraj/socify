# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  acts_as_follower
  acts_as_followable

  has_many :posts
  has_many :comments
  has_many :events

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, AvatarUploader

  validates_presence_of :name
  validates_length_of :email, :minimum => 4, :maximum => 50, :allow_blank => false
  validates_length_of :email, :minimum => 4, :maximum => 50, :allow_blank => false
  validates_length_of :phone_number, :minimum => 4, :maximum => 15, :allow_blank => false
  validates_length_of :dob, :minimum => 4, :maximum => 15, :allow_blank => false
  self.per_page = 10

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
