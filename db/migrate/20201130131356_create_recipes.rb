class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string     :title,           null: false
      t.integer    :servings,        default: 1
      t.integer    :prepTime
      t.integer    :cookTime
      t.text       :steps
      t.text       :ingredientsList
      t.string     :imageUrl
      t.references :author,          null: false, default: 1, foreign_key: { to_table: :users }
      t.decimal    :totalCal
      t.decimal    :totalProt
      t.decimal    :totalCarbs
      t.decimal    :totalFat
      t.string     :marmitonUrl

      t.timestamps
    end
  end
end
