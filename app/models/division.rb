class Division < ActiveRecord::Base
  belongs_to :league
  attr_accessible :name
end
