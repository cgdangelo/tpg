class Team < ActiveRecord::Base
  resourcify
  attr_accessible :name, :tag
end
