class AddPostProcessingColumnsToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :html, :text
    add_column :posts, :preview, :text
  end
end
