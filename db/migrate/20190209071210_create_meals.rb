class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :title
      t.text :menu
      t.integer :content_id
      t.timestamps
    end
  end
end
