class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :description
      t.integer :chapter_id

      t.timestamps
    end
  end
end
