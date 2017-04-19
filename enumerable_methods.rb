module Enumerable
	#tested
	def my_each
		for i in self
			yield(i)
		end
		self
	end

	#tested
	def my_each_with_index
		for i in 0..self.length-1
			yield(self[i], i)
		end
		self
	end

	#tested
	def my_select
		result = []
		for i in self
			result << i if yield(i) == true
		end
		#puts "#{result}"
		result
	end


	def my_all?
		
	end


	def my_any?
		
	end


	def my_none?
		
	end


	def my_count
		
	end


	def my_map
		
	end


	def my_inject
		
	end


	def multiply_els
		
	end
end

array = [3, 4, 6, 4, 4, 0, 23, 9]

=begin # my_each and my_each_with_index TESTS
array.my_each_with_index do |num, i|
	puts "Array num: #{num}\nIndex: #{i}"
end
=end

array.my_select do |i|
	i <= 4
end