class Team < ActiveRecord::Base
  resourcify
  attr_accessible :name, :tag, :password, :password_confirmation
  belongs_to :league
  has_secure_password
  validates_presence_of :password, :on => :create
  has_many :players
  has_many :users, :through => :players

  before_destroy :remove_all_associations

  def remove_all_associations
    Role.where(:id => self.roles.destroy_all)
    Player.where(:team_id => @id).destroy_all
  end

  def add_creator_roles(user)
    user.add_role :team_leader, self
    user.add_role :team_member, self
  end
end
