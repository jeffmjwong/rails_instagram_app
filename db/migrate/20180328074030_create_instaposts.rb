class CreateInstaposts < ActiveRecord::Migration[5.1]
  def change
    create_table :instaposts do |t|
      t.string :caption
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
