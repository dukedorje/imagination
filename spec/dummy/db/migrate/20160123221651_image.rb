class Image < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_path
      t.timestamps null: false
    end
  end
end
