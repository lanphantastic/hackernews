class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username,            uniqueness: true, null: false
      t.string :password_digest,                       null: false
      t.boolean :admin,                default: false, null: false
      t.boolean :disabled,             default: false, null: false
      t.integer :karma,                default: 0,     null: false
      t.text :about,
      t.string :submitted

      t.timestamps
    end
  end
end
