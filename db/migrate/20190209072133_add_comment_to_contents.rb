class AddCommentToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :comment, :text
  end
end
