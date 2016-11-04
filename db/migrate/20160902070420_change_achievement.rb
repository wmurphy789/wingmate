class ChangeAchievement < ActiveRecord::Migration
  def change
  	rename_column :user_achievements, :achievement_type_id, :achievement_id
  end
end
