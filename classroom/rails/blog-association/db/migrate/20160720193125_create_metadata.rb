class CreateMetadata < ActiveRecord::Migration[5.0]
  def change
    create_table :metadata do |t|
      t.string :language
      t.string :custom_url
      t.string :license
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
