class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  attr_accessible :user, :team, :guid
end
