class CreateAchievments < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
    	t.string :description
    	t.integer :achievement_id
    	t.integer :points
      	t.timestamps null: false
    end
  end
end
