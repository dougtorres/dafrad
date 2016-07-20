class RemovePlaceFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :place, :string
  end
end
