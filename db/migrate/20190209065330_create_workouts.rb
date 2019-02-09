class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :title
      t.text :menu
      t.integer :week_id
      t.integer :content_id
      t.timestamps
    end
  end
end
