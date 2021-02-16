class AddMessageToCollaborations < ActiveRecord::Migration[6.0]
  def change
    add_column :collaborations, :message, :text
  end
end
