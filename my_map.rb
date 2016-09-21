class Array
  def my_map(&block)
    result = []
    if block_given?
      self.each { |element| result << yield(element) }
    else
      result = to_enum :mapp
    end
    result
  end
end

a = [1, 2, 3, 4]
res = a.my_map do |x|
  x + 1
end
puts res

res1 = a.my_map(&:to_s)
puts res1.inspect






#puts ["a", "b"].my_map {|e| e+"hello" }
#puts ["a", "b"].my_map(&:to_i)
#puts ["a", "b"].my_map().inspect
