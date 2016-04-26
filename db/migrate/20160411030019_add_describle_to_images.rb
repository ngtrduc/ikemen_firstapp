class AddDescribleToImages < ActiveRecord::Migration
  def change
    add_column :images, :describle, :string
  end
end
