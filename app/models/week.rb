class Week < ActiveRecord::Base
  belongs_to :season
  attr_accessible :name
end
