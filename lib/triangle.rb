require 'pry'

# class Triangle

#     attr_accessor :length1, :length2, :length3

#   def initialize(length1, length2, length3)
#     @length1 = length1
#     @length2 = length2
#     @length3 = length3
#    end

#   def kind
#     if (length1 * length2 * length3) == 0 || (length1 + length2) <= length3 || (length2 + length3) <= length1 || (length3 + length1) <= length2
#       raise TriangleError

#     elsif length1 == length2 && length2 == length3
#       kind = :equilateral

#     elsif length1 == length2 || length1 == length3 || length2 == length3
#       kind = :isosceles

#     else
#       kind = :scalene
#     end
#   end

#   class TriangleError < StandardError
#      "Not a triangle"
#   end
# end

class Triangle
  attr_accessor :side1, :side2, :side3, :all_sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @all_sides = [side1, side2, side3]
  end

  def kind
    if self.all_sides.include?(0)
      begin 
        raise TriangleError, "each side must be larger than zero"
      end
    end
    if !(self.shortest.sum > self.longest)
      begin
        raise TriangleError, "sums of the lenght must exceed length of the third size: must follow triangle ineqaulity"
      end
    end
    unique = self.all_sides.uniq.length
    case unique
    when 1
      :equilateral
    when 2
      :isosceles
    when 3
      :scalene
    else
      "error"
    end
  end

  class TriangleError < StandardError
  
    # def self.triangle_inequality
    #   # puts "sums of the lenght must exceed length of the third size: must follow triangle ineqaulity"
    # end

    # def self.bigger_than_zero
    #   puts "each side must be larger than zero"
    # end

  end

  private

  def longest
    all_sides.max()
  end

  def shortest
    all_sides.min(2)
  end

end




# binding.pry
# 'pls'