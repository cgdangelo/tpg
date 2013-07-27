class Team < ActiveRecord::Base
  resourcify
  attr_accessible :name, :tag, :password, :password_confirmation
  belongs_to :league
  has_secure_password
  validates_presence_of :password, :on => :create
end
