class Act < ActiveRecord::Base
  attr_accessible :name
  has_many :chapters
  has_many :topics, :through => :chapters
end
