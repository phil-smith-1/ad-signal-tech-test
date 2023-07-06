class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.integer :video_id, null: false
      t.string :path, null: false

      t.timestamps
    end
  end
end
