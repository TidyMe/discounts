module Discounts
  class Coupon < ActiveRecord::Base
    # ATTRIBUTES
    # string code - cant be null
    # string description - put limit of 120 like twitter
    # datetime valid_from - cant be null, Time.current by default
    # datetime valid_until - if null then coupon never expires
    # integer limit (max times can be used) - cant be null, if zero then no limit
    # integer redeemed - (times been used so far) - cant be null, default is zero
    # decimal amount - cant be null, default zero
    # integer type - enum percentage, amount
    #
    # METHODS
    # def autogenerate code when creating and no code entered, before_create -> autogenerate code if code null
    # def apply(price) - see what discount would be
    # def redeem(job) - apply discount to job, default is def redeem(object) which saves into objects coupon_code field
    #
    # NB
    # maybe integer job_id
    # free is percentage 100
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
