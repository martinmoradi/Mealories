class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title, null:false
      t.integer :servings, null:false
      t.integer :preptime, null:false
      t.integer :cooktime, null:false
      t.text :steps, null:false
      t.text :ingredients, null:false
      t.string :image, null:false
      t.bigint "author_id", default: 0
      t.integer :calories
      t.integer :total_daily

      t.timestamps
    end
  end
end
