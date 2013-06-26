class Game < ActiveRecord::Base
  resourcify
  has_many :leagues
  attr_accessible :active, :description, :name
  validates_presence_of :description, :name
  validates :active, :inclusion => { :in => [true, false] }
  after_save :set_leagues_inactive

  def active?
    self.active
  end

  def set_leagues_inactive
    if !self.active
      League.where(:game_id => self.id).each do |league|
        league.deactivate!
      end
    end
  end
end
