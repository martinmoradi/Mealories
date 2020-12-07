class AddDietToPlans < ActiveRecord::Migration[6.0]
  def change
    add_column :plans, :diet, :integer, null: false, default: 1
  end
end
