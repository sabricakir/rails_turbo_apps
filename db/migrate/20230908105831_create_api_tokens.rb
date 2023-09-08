class CreateApiTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :api_tokens do |t|
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
