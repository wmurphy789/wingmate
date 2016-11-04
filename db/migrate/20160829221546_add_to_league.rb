class AddToLeague < ActiveRecord::Migration
  def change
  	add_column :leagues, :timed, :datetime
  end
end
