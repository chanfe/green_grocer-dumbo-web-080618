require 'pry'
def consolidate_cart(cart)
  # code here
  new_cart = {}
  cart.each_with_index do |e, i|
    e.each do |k, v|
      v[:count] = cart.count(e)
    end
    new_cart.merge!(cart[i])
  end

  new_cart
end

def apply_coupons(cart, coupons)
  # code here
  new_cart = {}
  cart.each do |key, data|
    for i in 0..coupons.length-1
      if coupons[i][:item] == key && data[:count] >= coupons[i][:num]
        
        new_cart["#{key} W/COUPON"] = {:price => coupons[i][:cost], :clearance => cart[key][:clearance], :count => data[:count]/coupons[i][:num]}
        
        data[:count] %= coupons[i][:num]
        cart.merge(new_cart)
        if data[:count] == 0
          cart.delete(key)
        end
      end 
    end
  end
  binding,pry
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end