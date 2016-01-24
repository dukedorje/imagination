class Image < ActiveRecord::Migration
  def change
    create_table :images do |t|
      # t.string :image_path
      t.string :image_file_id
      t.timestamps null: false
    end
  end
end
