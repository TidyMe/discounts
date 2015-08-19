module Discounts
  class Coupon < ActiveRecord::Base

    after_initialize do
      self.code ||= self.generate_code
      self.valid_from ||= Date.current
    end

    enum type: [:percentage, :portion]

    validates :code, :valid_from, :limit, :type, :redeemed, :amount, presence: true
    validates :description, length: { maximum: 160 }
    validates :amount, numericality: { greater_than: 0 }
    validates :amount, numericality: { less_than_or_equal_to: 100, if: :percentage? }

    def generate_code
      SecureRandom.hex(6)[0, 6].upcase
    end

    def begins
      valid_from.strftime('%d/%m/%Y')
    end

    def expires
      if valid_until
        valid_until.strftime('%d/%m/%Y')
      else
        'Never'
      end
    end

    def begun?
      Time.current > valid_from
    end

    def expired?
      valid_until && Time.current > valid_until
    end

    def spent?
      redeemed >= limit
    end

    def redeemable?
      begun? && !expired? && !spent?
    end

    def free?
      percentage? && amount == 100
    end

    def apply(price) # What price will be after discount
      if percentage?
        price - (price * (amount/100))
      elsif portion?
        price - amount
      end
    end

    def discounted(price) # How much is taken off
      if percentage?
        price * (amount/100)
      elsif portion?
        amount
      end
    end

    def redeem_on(item) # Save coupon code to an item (item will be job)
      Coupon.transaction do
        item.update!(coupon_code: code)
        self.update!(redeemed: redeemed + 1)
      end
    end

    #
    # NB
    # use query to find completed or uncompleted jobs that have used coupon
    # jobs must store coupon code
    # controller and views are generic and then in main app put inside admin security and styling layouts
    #
    # MAIN APP FUNCTION
    # every nth customer can be done later (might need to be something done in rails app)
    # --> interface can be apply AMOUNT of TYPE to every NTH clean
    # needs to also do it only for recurring cleans
    # needs to apply the coupon in booking form if it is in params
  end
end
