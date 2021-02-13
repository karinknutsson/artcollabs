class AddLocationToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :location, :string
  end
end
