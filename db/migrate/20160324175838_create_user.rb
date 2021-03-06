class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.timestamp
    end

    add_index :users, :name
  end
end
