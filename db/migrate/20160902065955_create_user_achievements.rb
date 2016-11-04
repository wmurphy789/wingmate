class CreateUserAchievements < ActiveRecord::Migration
  def change
    create_table :user_achievements do |t|
    	t.integer :achievement_type_id
    	t.integer :user_id
    	t.integer :league_id
      	t.timestamps null: false
    end
  end
end
