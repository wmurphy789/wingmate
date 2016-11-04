class CreateLeagueTable < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
    	t.string :name
    	t.string :type
    	t.integer :points
      	t.timestamps null: false
    end
  end
end
