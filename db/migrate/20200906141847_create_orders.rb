class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :paymethod, null: false
      t.integer :end_user_id, null: false
      t.integer :total_payment, null: false
      t.integer :paymethod, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.string :address, null: false
      t.string :zipcode, null: false
      t.string :addressee, null: false
      t.integer :postage, null: false, default: 800
      t.timestamps
    end
  end
end
