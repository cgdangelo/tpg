class Game < ActiveRecord::Base
  resourcify
  has_many :leagues
  attr_accessible :active, :description, :name
  validates_presence_of :description, :name
  validates :active, :inclusion => { :in => [true, false] }
  after_save :set_leagues_inactive

  #
  # Fetch games marked as active
  #
  # @return Array
  def self.active_games
    Game.where(:active => true)
  end

  #
  # Determines whether a league is suitable for play or not.
  #
  # Anticipating future conditions that would classify a game as inactive
  # or unsuitable for play.
  #
  # @return Boolean
  def active?
    self.active
  end

  #
  # Deactivate all active leagues for the current game
  def set_leagues_inactive
    if !self.active?
      active_leagues.each do |league|
        league.deactivate!
      end
    end
  end

  #
  # Fetch all _active_ leagues for this game
  #
  # @return Array
  def active_leagues
    self.leagues.where(:active => true)
  end
end
