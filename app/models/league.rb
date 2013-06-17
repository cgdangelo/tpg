class League < ActiveRecord::Base
  belongs_to :game
  attr_accessible :active, :description, :name
end
