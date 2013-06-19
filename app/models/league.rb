class League < ActiveRecord::Base
  resourcify
  belongs_to :game
  attr_accessible :active, :description, :name
  validates_presence_of :active, :description, :name

  def add_admin(user)
    user.add_role :league_admin, self
  end

  def remove_admin(user)
    user.remove_role :league_admin, self
  end
end
