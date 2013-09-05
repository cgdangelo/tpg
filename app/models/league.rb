class League < ActiveRecord::Base
  resourcify
  belongs_to :game
  has_many :divisions
  has_many :seasons
  attr_accessible :active, :description, :name
  validates_presence_of :description, :name
  validates :active, :inclusion => { :in => [true, false] }

  #
  # Add a user as league admin
  def add_admin(user)
    user.add_role :league_admin, self
  end

  #
  # Remove a user's admin privileges
  def remove_admin(user)
    user.remove_role :league_admin, self
  end

  #
  # Activate the league
  def activate!
    self.active = true
    save
  end

  #
  # Deactivate the league
  def deactivate!
    self.active = false
    save
  end

  #
  # Fetch all admins
  #
  # @return Array
  def admins
    User.with_role(:league_admin, self)
  end
end
