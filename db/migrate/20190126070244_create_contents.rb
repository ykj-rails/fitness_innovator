class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :title
      t.integer :before_body_weight
      t.integer :after_body_weight
      t.string :period
      t.integer :user_id

      t.timestamps
    end
  end
end
