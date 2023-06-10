class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :title
      t.text :description
      t.text :address

      t.timestamps
    end
  end
end
