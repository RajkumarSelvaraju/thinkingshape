class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :fname
      t.string :lname
      t.string :company
      t.string :country
      t.string :mobile
      t.string :email

      t.timestamps null: false
    end
  end
end
