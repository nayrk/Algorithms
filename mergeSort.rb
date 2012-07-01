# Merge Sort
def merge_sort(list)
	return list if list.size <= 1
	left, right = [], []
	middle = list.size / 2
	
	left = list[0,middle]
	right = list[middle..-1]

	left = merge_sort(left)
	right = merge_sort(right)

	merge(left,right)
end

def merge(left,right)
	result = []
	until left.empty? or right.empty?
		result << (left[0] < right[0] ? left.shift : right.shift)
	end
	result + left + right
end

if __FILE__ == $PROGRAM_NAME
	list = [6,5,3,1,8,7,2,4]	
	p merge_sort(list)
end
