class Array
	def my_sort
		  array = self
		  n = array.length
		  loop do
		    swapped = false
		    (n-1).times do |i|
		      if array[i] > array[i+1]
		        array[i], array[i+1] = array[i+1], array[i]
		        swapped = true
		      end
		    end

		    break if not swapped
		  end
		  array
	end
end

#puts [5, 9, 7, 2].my_sort
#puts ["a", "d", "b", "f"].my_sort


