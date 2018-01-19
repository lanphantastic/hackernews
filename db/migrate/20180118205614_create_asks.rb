class CreateAsks < ActiveRecord::Migration[5.1]
  def change
    create_table :asks do |t|
      t.string :username
      t.integer :descendants, null: false
      t.integer :item_id, null: false
      t.integer :score
      t.integer :time, null: false
      t.string :title
      t.string :item_type, null: false
      t.string :url
      t.text :content
      t.timestamps
    end
  end
end
