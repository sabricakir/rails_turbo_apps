class AddAccessAndPasscodeToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :access, :string
    add_column :movies, :passcode, :string
  end
end
