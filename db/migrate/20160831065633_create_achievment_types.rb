class CreateAchievmentTypes < ActiveRecord::Migration
  def change
    create_table :achievment_types do |t|
    	t.string :name
      	t.timestamps null: false
    end
  end
end
