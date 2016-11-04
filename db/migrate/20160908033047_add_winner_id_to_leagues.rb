class AddWinnerIdToLeagues < ActiveRecord::Migration
  def change
  	add_column :leagues, :winner_id, :integer
  end
end
