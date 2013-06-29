class Team < ActiveRecord::Base
  resourcify
  attr_accessible :name, :tag
  belongs_to :league
end
