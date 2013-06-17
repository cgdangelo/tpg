class Game < ActiveRecord::Base
  attr_accessible :active, :description, :name
  validates_presence_of :active, :description, :name
  resourcify
end
