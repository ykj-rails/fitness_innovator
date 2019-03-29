class RemoveTitleFromContents < ActiveRecord::Migration[5.2]
  def change
    remove_column :contents, :title, :string
  end
end
