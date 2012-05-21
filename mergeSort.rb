# Merge Sort
def merge_sort(list)
	return list if list.size == 1
	left, right = [], []
	middle = list.size / 2
	list.each_with_index do |value,index|
		index < middle ? left << value : right << value
	end
	left = merge_sort(left)
	right = merge_sort(right)
	merge(left,right)
end

def merge(left,right)
	result = []
	while left.size > 0 or right.size > 0
		if left.size > 0 and right.size > 0 
			if left[0] <= right[0]
				result << left.shift	
			else
				result << right.shift	
			end
		elsif left.size > 0
			result << left.shift
		elsif right.size > 0
			result << right.shift
		end
	end
	result
end

if __FILE__ == $PROGRAM_NAME
	list = [6,5,3,1,8,7,2,4]	
	p merge_sort(list)
end
