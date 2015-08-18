class CreateDiscountsCoupons < ActiveRecord::Migration
  def change
    create_table :discounts_coupons do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
