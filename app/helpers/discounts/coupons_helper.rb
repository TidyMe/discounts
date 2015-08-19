module Discounts
  module CouponsHelper
    def display_amount(coupon)
      if coupon.percentage?
        "#{number_to_percentage(coupon.amount, strip_insignificant_zeros: true)} off!"
      elsif coupon.portion?
        "#{number_to_currency(coupon.amount)} off!"
      end
    end

    def display_discount(coupon, price)
      "- #{number_to_currency(coupon.discounted(price))}"
    end
  end
end
