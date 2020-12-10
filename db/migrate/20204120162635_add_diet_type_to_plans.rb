class AddDietTypeToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :diet_type, :integer, default: 1
  end
end
