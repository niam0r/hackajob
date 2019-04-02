require 'prime'

class Solution
  def run(number)
    possible_prime_factors = []
    Prime.each(number) { |prime| possible_prime_factors << prime }
    products_array = []
    possible_prime_factors.to_a.each do |factor_a|
      possible_prime_factors.to_a.each do |factor_b|
        products_array << factor_a * factor_b
      end
    end
    !products_array.find_index(number).nil?
  end
end

puts Solution.new.run(91)
# Solution.new.run(91)
