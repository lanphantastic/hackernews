class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :user_id, null: false
      t.boolean :disabled, default: false, null: false
      t.integer :comments_count, default: 0, null: false
      t.integer :score, default: 0, null: false
      t.integer :rank, default: 0, null: false

      t.timestamps
    end
  end
end
