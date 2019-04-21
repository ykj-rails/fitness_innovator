class ChangeDataBeforeWeightToContent < ActiveRecord::Migration[5.2]
  def change
    change_column :contents, :before_body_weight, :decimal, precision: 10 , scale: 1
  end
end
