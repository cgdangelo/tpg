class League < ActiveRecord::Base
  resourcify
  belongs_to :game
  attr_accessible :active, :description, :name
  validates_presence_of :description, :name
  validates :active, :inclusion => { :in => [true, false] }

  def add_admin(user)
    user.add_role :league_admin, self
  end

  def remove_admin(user)
    user.remove_role :league_admin, self
  end

  def activate!
    self.active = true
    self.save
  end

  def deactivate!
    self.active = false
    self.save
  end
end
