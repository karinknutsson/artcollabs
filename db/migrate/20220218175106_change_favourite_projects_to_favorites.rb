class ChangeFavouriteProjectsToFavorites < ActiveRecord::Migration[6.0]
  def change
    rename_table :favourite_projects, :favorites
  end
end
