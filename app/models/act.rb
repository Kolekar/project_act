class Act < ActiveRecord::Base
  attr_accessible :name
  has_many :chapters
end
