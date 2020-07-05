class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :vido, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
