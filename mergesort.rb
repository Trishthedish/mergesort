def mergesort(a)
    # if the array size is 0|1 then the list is considered sorted, return sorted array
    if a.length == 0 || a.length == 1
      return a
    end
    # split the list into two halves
    left, right = split_array(a)
    puts "#left:{left}, Right:#{right}"
    # merge sort each half
    left = mergesort(left)
    right = mergesort(right)
    # combine the sorted halves
    # assumes their in order.
    return combine(left, right)
end

def split_array(a)
    # find the middle index
    # split the array in half - take a look at take and drop in the ruby docs, or use ranges
    mid = a.length/2
    # return left and right halves of array as separate arrays - did you know a method can return multiple arrays? look it up
    return a[0...mid], a[mid..-1]
end

# precondition: a and b are sorted
# assume they are in order.
def combine(a, b)
    # create a results array
    result = []
    # counters pointing to the index of the smallest elements in each array - you may not need to do this step if you use some fancy ruby methods
    # above note necessaryn if working with ruby
    # check that we have elements to compare (neither array can be empty)
    while !a.empty? && !b.empty?
    # push the smaller element onto the result array
      if a.first < b.first
        result << a.shift
      else
        result << b.shift
      end
      # if there are elements left over in a, move them to result
      # if there are elements left over in b, move them to result
      while !b.empty?
        result << b.shift
      end
      # return the results array
      return result
    end




end

# TEST IT
a = [6,23,53,1,2,5,62,61,33,21,14,6,23]
a = a.shuffle
puts "ORIGINAL \n" + a.to_s
a = mergesort(a)
puts "AFTER MERGESORT \n" + a.to_s
