class AddPlaceToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :place, :string
  end
end
