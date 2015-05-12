class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :po_no
      t.integer :customer_id
      t.date :po_date
      t.date :due_date

      t.timestamps null: false
    end
  end
end
