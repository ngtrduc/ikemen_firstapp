class AddPlaceToImages < ActiveRecord::Migration
  def change
    add_column :images, :place, :string
  end
end
