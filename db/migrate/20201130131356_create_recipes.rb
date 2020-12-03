class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string     :title,           null: false
      t.integer    :servings,        default: 1
      t.integer    :prep_time
      t.integer    :cook_time
      t.text       :steps
      t.text       :ingredients_list
      t.string     :image_url
      t.references :author,          null: false, default: 1, foreign_key: { to_table: :users }
      t.decimal    :total_cal
      t.decimal    :total_prot
      t.decimal    :total_carbs
      t.decimal    :total_fat
      t.string     :marmiton_url

      t.timestamps
    end
  end
end
