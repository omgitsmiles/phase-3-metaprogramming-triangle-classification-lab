class Triangle

    attr_accessor :length1, :length2, :length3

  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
   end

  def kind
    if (length1 * length2 * length3) == 0 || (length1 + length2) <= length3 || (length2 + length3) <= length1 || (length3 + length1) <= length2
      raise TriangleError

    elsif length1 == length2 && length2 == length3
      kind = :equilateral

    elsif length1 == length2 || length1 == length3 || length2 == length3
      kind = :isosceles

    else
      kind = :scalene
    end
  end

  class TriangleError < StandardError
    
  end
end
