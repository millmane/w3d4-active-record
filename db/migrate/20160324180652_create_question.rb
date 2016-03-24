class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.integer :poll_id, null: false

      t.timestamp
    end

    add_index :questions, :poll_id
    add_index :questions, :text
  end
end
