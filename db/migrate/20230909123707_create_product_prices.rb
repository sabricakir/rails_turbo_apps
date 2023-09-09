class CreateProductPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :product_prices do |t|
      t.decimal :cost
      t.bigint :product_id, null: false
      t.timestamps
    end
  end
end
