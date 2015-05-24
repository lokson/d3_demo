class CreateDatabase < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :role
      t.string :name
      t.string :password
      t.timestamps null: false
    end
    add_index :users, :name, unique: true

    create_table :roles do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
