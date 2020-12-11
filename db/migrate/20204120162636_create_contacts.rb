class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :email,                null: false
      t.text   :message,              null: false
      t.string :subject,              null: false
      t.timestamps
    end
  end
end
