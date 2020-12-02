class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.references    :lunch,     null: false, foreign_key: {to_table: :recipes}
      t.references    :dinner,    null: false, foreign_key: {to_table: :recipes}
      t.references    :plan,      null: false, foreign_key: true
        
      t.timestamps
    
    end
  end
end
