class Charge < ActiveRecord::Base
  def amount
    amount_in_cents / 100.0
  end
end
