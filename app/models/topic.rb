class Topic < ActiveRecord::Base
  attr_accessible :chapter_id, :description, :name
    belongs_to :chapter
end
