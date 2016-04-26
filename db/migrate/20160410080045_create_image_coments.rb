class CreateImageComents < ActiveRecord::Migration
  def change
    create_table :image_coments do |t|
      t.string :user_id
      t.integer :image_id
      t.string :comment

      t.timestamps null: false
    end
  end
end
