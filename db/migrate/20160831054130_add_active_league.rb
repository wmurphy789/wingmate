class AddActiveLeague < ActiveRecord::Migration
  def change
  	add_column :league_users, :active, :boolean
  end
end
