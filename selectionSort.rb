# Selection Sort
def selectionSort(list)
	list.each_index do |i|
		min = i

		(i..(list.size-1)).each do |j|
			min = j if list[j] < list[min]
		end

		list[min], list[i] = list[i], list[min]
	end
	list
end

if __FILE__ == $PROGRAM_NAME
	list = [3,1,2,4,5,7,8,6]	
	p selectionSort(list)
end
