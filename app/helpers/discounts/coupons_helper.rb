module Discounts
  module CouponsHelper
    def display_amount(coupon)
      if coupon.percentage?
        "#{coupon.amount}% off!"
      elsif coupon.portion?
        "#{number_to_currencey(coupon.amount)} off!"
      end
    end

    def display_discount(coupon, price)
      "- #{number_to_currency(coupon.discounted(price))}"
    end
  end
end
