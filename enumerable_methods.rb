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
		#each_with_index(*args) { |obj, i| block } → enum
		#each_with_index(*args) → an_enumerator
		#Calls block with two arguments, the item and its index, for each item in enum. Given arguments are passed through to each(). If no block is given, an enumerator is returned instead.
		for i in 0..self.length-1
			yield(self[i], i)
		end
		self
	end

	#tested
	def my_select
		#select { |obj| block } → array
		#select → an_enumerator
		#Returns an array containing all elements of enum for which the given block returns a true value. If no block is given, an Enumerator is returned instead.
		result = []
		for i in self
			result << i if yield(i) == true
		end
		#puts "#{result}"
		result
	end

	#tested
	def my_all?
		#all? [{ |obj| block }] → true or false
		#Passes each element of the collection to the given block. The method returns true if the block never returns false or nil. If the block is not given, Ruby adds an implicit block of { |obj| obj } which will cause all? to return true when none of the collection members are false or nil.
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

	#tested
	def my_any?
		#any? [{ |obj| block }] → true or false
		#Passes each element of the collection to the given block. The method returns true if the block ever returns a value other than false or nil. If the block is not given, Ruby adds an implicit block of { |obj| obj } that will cause any? to return true if at least one of the collection members is not false or nil.
		result = false
		if block_given?
			for i in self
				result = yield(i)
				#puts result
				if result == true
					puts "Result = #{result}"
					return true
				end
			end
		else
			for i in self
				if i != false && i != nil
					#puts "true"
					return true
				end
				#puts "false"
			end
		end
		puts "Result = #{result}"
		result
	end

	# tested
	def my_none?
		#none? [{ |obj| block }] → true or false
		#Passes each element of the collection to the given block. The method returns true if the block never returns true for all elements. If the block is not given, none? will return true only if none of the collection members is true.
		result = true
		if block_given?
			for i in self
				result = yield(i)
				# puts result
				if result == true
					# puts "Result = #{result}\nSo returning false"
					return false
				end
			end
		else
			for i in self
				if i == true
					# puts "false"
					return false
				end
				# puts "false"
			end
		end
		# puts "Result = #{result}\nReturn: True"
		true
	end


	def my_count(num = nil)
		#count → int
		#count(item) → int
		#count { |obj| block } → int
		#Returns the number of items in enum through enumeration. If an argument is given, the number of items in enum that are equal to item are counted. If a block is given, it counts the number of elements yielding a true value.
		if num
			return self.my_select {|i| i == num}.length
		end
		if block_given?
			count = 0
			self.my_each do |element|
				count += 1 if yield(element)
			end
			return count
		else
			return self.size
		end
	end


	def my_map
		# map { |obj| block } → array
		# map → an_enumerator
		# Returns a new array with the results of running block once for every element in enum.
		# If no block is given, an enumerator is returned instead.
	end


	def my_inject
		# inject(initial, sym) → obj click to toggle source
		# inject(sym) → obj
		# inject(initial) { |memo, obj| block } → obj
		# inject { |memo, obj| block } → obj
		# Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator.

		# The inject and reduce methods are aliases. There is no performance benefit to either.

		# If you specify a block, then for each element in enum the block is passed an accumulator value (memo) and the element. If you specify a symbol instead, then each element in the collection will be passed to the named method of memo. In either case, the result becomes the new value for memo. At the end of the iteration, the final value of memo is the return value for the method.

		# If you do not explicitly specify an initial value for memo, then the first element of collection is used as the initial value of memo.
	end


	def multiply_els
		
	end
end

array = [3, 4, 2, 4, 4, 0, 23, 9]
#array = [false, 1, nil]

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

# array.my_any? {|num| num >= 24}
# puts "true" if array.any? {|num| num >= 23}

# array.my_none? {|num| num >= 4}
# puts "---------------------"
# puts array.none? {|num| num >= 4} ? "true" : "false"

# puts array.my_count {|num| num % 2 == 0}