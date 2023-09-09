class CreatePostPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :post_prices do |t|
      t.decimal :cost
      t.bigint :post_id, null: false
      t.timestamps
    end
  end
end
