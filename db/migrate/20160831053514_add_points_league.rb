class AddPointsLeague < ActiveRecord::Migration
  def change
  	add_column :league_users, :points, :string
  end
end
