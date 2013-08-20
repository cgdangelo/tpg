class Division < ActiveRecord::Base
  resourcify
  belongs_to :league
  attr_accessible :name
end
