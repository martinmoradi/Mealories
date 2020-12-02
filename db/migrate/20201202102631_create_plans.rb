# Schema.rb
# t.bigint "user_id", null: false
#################################


class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
