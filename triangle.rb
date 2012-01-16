def triangle(a, b, c)

if (a <= 0) || (b <= 0) || (c <= 0)
	raise TriangleError,"cant have sides less than or equal to zero.."
		else
		     if (a+b <= c) || (a+c <= b) || (b+c <= a) 
		      raise TriangleError,"cant have sum of two sides less than or equal to the third"
                     end
     
end

if a==b && b==c
       :equilateral
	else
		if a==b || b==c || a==c
		:isosceles
			else
			:scalene
	                end
        end
end
# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end


