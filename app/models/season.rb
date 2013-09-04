class Season < ActiveRecord::Base
  belongs_to :league
  attr_accessible :active, :name
end
