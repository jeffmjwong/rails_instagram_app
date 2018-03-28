class AddPhotoToInstaposts < ActiveRecord::Migration[5.1]
  def change
    add_column :instaposts, :photo, :string
  end
end
