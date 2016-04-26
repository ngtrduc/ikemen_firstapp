class CreateShareds < ActiveRecord::Migration
  def change
    create_table :shareds do |t|
      t.integer :Sharer_id
      t.integer :shared_id

      t.timestamps null: false
    end
    add_index :shareds, :sharer_id
    add_index :shareds, :shared_id
    add_index :shareds, [:sharer_id, :shared_id], unique: true
  end
end
