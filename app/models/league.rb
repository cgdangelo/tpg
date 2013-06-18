class League < ActiveRecord::Base
  resourcify
  belongs_to :game
  attr_accessible :active, :description, :name
  validates_presence_of :active, :description, :name
end
