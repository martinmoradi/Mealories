class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title, null:false
      t.integer :servings
      t.integer :preptime
      t.integer :cooktime
      t.text :steps
      t.text :ingredients
      t.string :image
      t.references :user, null: false, foreign_key: true
      t.integer :calories
      t.integer :total_daily

      t.timestamps
    end
  end
end
