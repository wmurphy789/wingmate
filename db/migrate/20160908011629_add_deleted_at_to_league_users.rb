class AddDeletedAtToLeagueUsers < ActiveRecord::Migration
  def change
    add_column :league_users, :deleted_at, :datetime
    add_index :league_users, :deleted_at
  end
end
