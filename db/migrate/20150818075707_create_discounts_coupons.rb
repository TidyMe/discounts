class CreateDiscountsCoupons < ActiveRecord::Migration
  def change
    create_table :discounts_coupons do |t|
      t.string :code, null: false
      t.string :description, limit: 160
      t.date :valid_from, null: false, default: Date.current
      t.date :valid_until
      t.integer :limit, default: 0, null: false
      t.integer :redeemed, default: 0, null: false
      t.decimal :amount, precision: 5, scale: 2, default: 0, null: false
      t.integer :amount_type, null: false

      t.timestamps null: false
    end
  end
end
