class CreatePics < ActiveRecord::Migration[5.1]
  def change
    create_table :pics do |t|
      t.string :title
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
