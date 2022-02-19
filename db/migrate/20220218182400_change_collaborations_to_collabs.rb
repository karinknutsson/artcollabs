class ChangeCollaborationsToCollabs < ActiveRecord::Migration[6.0]
  def change
    rename_table :collaborations, :collabs
  end
end
