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

	#tested
	def my_all?
		result = true
		if block_given?
			for i in self
				result = yield(i)
				#puts result
				if result == false || result == nil
					#puts "Result = #{result}"
					return false
				end
			end
		else
			for i in self
				if i == false || i == nil
					#puts "false"
					return false
				end
				#puts "true"
			end
		end
		#puts "Result = #{result}"
		result
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

array = [3, 4, 2, 4, 4, 0, 23, 9]

=begin # my_each and my_each_with_index TESTS
array.my_each_with_index do |num, i|
	puts "Array num: #{num}\nIndex: #{i}"
end
=end

=begin
array.my_select do |i|
	i <= 4
end
=end

array.my_all?
