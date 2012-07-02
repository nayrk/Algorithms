# Quick Sort

$c = 0

def quickSort(a,l,r)
	return a if r - l <= 0
	p = partition(a,l,r)
	quickSort(a,l,p-1)
	quickSort(a,p+1,r)
	a
end

def partition(a,l,r)
	#Get middle element and swap
#	if l == 0
#		# its even
#		if (r + 1)%2==0
#			m = ((r + 1)/2) - 1
#		else
#			m = (r+1)/2
#		end
#	else
#		m = (r + l)/2
#	end
#
	#puts "Array : #{a}"
	#puts "l is #{l} , r is #{r}"
	#puts "A at m is : #{a[m]}"
	#puts "First value is #{a[l]}"
	#puts "Last value is #{a[r]}"

	#x = a[l]
	#b = a[m]
	#c = a[r]

	#middle = (x <= b) ? ((b <= c) ? b : ((x < c) ? c : x)) : ((x <= c) ? x : ((b < c) ? c : b))

	#if middle == a[l]
	#	m = l
	#elsif middle == a[m]
	#	m = m
	#elsif middle == a[r]
	#	m = r
	#end

	#puts "#{a[l]} < #{a[m]} < #{a[r]}"
	#puts "Middle is #{a[m]}"

	#a[l],a[m] = a[m],a[l]
	

	# Always using last element
	#Swap first and last
	#a[l],a[r] = a[r],a[l]
	
	p = a[l]

	i = l + 1

	for j in i..r
		$c += 1
		if a[j] < p #do nothing if it's bigger
			a[j], a[i] = a[i], a[j] #swap
			i += 1
		end
	end
	a[l],a[i-1], = a[i-1],a[l]
	return i-1	
end

def qsort(list)
	return list if list.size <= 1
	pivot = list.shift
	left, right = list.partition {|e| e < pivot }
	qsort(left) + [pivot] + qsort(right)
end

if __FILE__ == $PROGRAM_NAME
	contents = File.open('./QuickSort.txt').read.split("\n")
	contents = contents.map {|i| i.to_i}
	quickSort(contents,l=0,r=contents.size-1)
	puts "Count is : #{$c}"
end
