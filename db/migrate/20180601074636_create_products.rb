class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :handle
      t.string :shopify_id
      t.timestamps
      t.references :shop, foreign_key: true
    end
  end
end
