class CreateRecipeDayAssigments < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_day_assigment do |t|


      t.timestamps
    end
  end
end
