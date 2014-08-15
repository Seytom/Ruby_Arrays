"""I wrote these functions for Homework_0, pt. 1 in EDx course 'Engineering Software as a Service' """

def sum(any_array)
	"""Returns the sum of all the values of an array of numbers"""
	total  = 0
	any_array.each {|num| total +=num}
	total
end

def max_2_sum(any_array)
	"""Returns the sum of the two largest numbers of an array of numbers"""
	total = 0
	copy = any_array.sort #Get the numbers in order, without changing the array outside the function
	if any_array.length ==1 #First two conditions are corner cases. Feel there must be a more elegant way.
		total = copy[0]
	elsif any_array.length ==0
		total
	else
		total = copy[-1] + copy[-2] #Adds the two largest values of the array
	end
	total
end

def sum_to_n?(any_array, n)
	"""Takes an array of integers and an additional integer, n, as arguments. Returns true if any two distinct elements in the array of integers sum to n. Uses method include? from the standard mixin Enumerables"""
	 	
	if any_array.length >= 2
		#Array must have at least 2 elements		 
		any_array.each do |num|
			#This block runs through each element of the array, checking to see if an element can
			#be added to the value of any element in the array to total n						
			if any_array.include? n-num
				float = n.to_f #Prepare for division in next step
				if num==float/2 #This block weeds out the case of adding a single element to itself, leaves the case
					        #where two elements have the same value					
					check = any_array.find_all {|elem| elem==num}
					if check.length < 2 #Needs to be two of the same number
						return false
					end
				end				
				return true
		  	end			
		end		
	end
	#Will have already returned true if the conditions were met
	return false
end

ary = [5,7,8,3,3,-5]
one_ary = [11]
emp_ary = []

#Test Cases

puts "Hello"  # Might as well be friendly
puts sum(ary) #=> 21 (If I haven't changed ary)
puts sum(emp_ary) #=> 0
puts sum(one_ary) #=> 11
puts max_2_sum(ary) #=> 15 (If I haven't changed ary)
puts max_2_sum(one_ary) #=> 11
puts max_2_sum(emp_ary) #=> 0
puts sum_to_n?(ary, 15) #=> true  (8+7 -- note necessary conversion of n to a float)
puts sum_to_n?(ary, 16) #=> false (Doesn't add the same number twice)
puts sum_to_n?(ary, 6) #=> true   (3+3, handles sum of equals)
puts sum_to_n?(ary, -1) #=> false (handles negative n)
puts sum_to_n?(ary, -2) #=> true  (3+(-2) handles negative values)
puts sum_to_n?(one_ary, -2) #=> false
puts sum_to_n?(emp_ary, -2) #=> false




