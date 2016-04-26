class AddDeletedToImages < ActiveRecord::Migration
  def change
    add_column :images, :deleted, :integer
  end
end
