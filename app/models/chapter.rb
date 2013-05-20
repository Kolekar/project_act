class Chapter < ActiveRecord::Base
  attr_accessible :act_id, :name
  belongs_to :act
   has_many :topics
end
