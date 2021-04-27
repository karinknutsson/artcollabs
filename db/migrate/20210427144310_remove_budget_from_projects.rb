class RemoveBudgetFromProjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :budget, :string
  end
end
