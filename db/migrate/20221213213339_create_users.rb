class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :external_id
      t.string :first_name
      t.string :last_name
      t.string :status
      t.string :external_created_at

      t.timestamps
    end
  end
end
