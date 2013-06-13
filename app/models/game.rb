class Game < ActiveRecord::Base
  attr_accessible :active, :description, :name
end
