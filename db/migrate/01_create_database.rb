class CreateDatabase < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :role
      t.string :name
      t.string :password
      t.integer :logins_count, default: 0
      t.datetime :last_login_at
      t.timestamps null: false
    end
    add_index :users, :name, unique: true

    create_table :roles do |t|
      t.references :view
      t.string :name
      t.timestamps null: false
    end
    add_index :roles, :name, unique: true

    create_table :views do |t|
      t.string :name
    end
    add_index :views, :name, unique: true

    create_table :view_groups do |t|
      t.references :view
      t.references :group
    end

    create_table :groups do |t|
      t.string :name
    end
    add_index :groups, :name, unique: true

    create_table :subgroups do |t|
      t.references :group
      t.string :name
    end
    add_index :subgroups, :name, unique: true

    create_table :role_subgroups do |t|
      t.references :role
      t.references :subgroup
      t.timestamps null: false
    end
  end
end
