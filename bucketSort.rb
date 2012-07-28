# Bucket Sort

require './mergeSort.rb'

def bucket_sort(list,width)

	high = list[0]
	low = list[0]

	# Look for the min and max
	for i in 1...list.size
		high = list[i] if list[i] > high
		low = list[i] if list[i] < low
	end

	# Create the bucket
	buckets = Array.new(high - low + 1){[]}

	p buckets.size

	for i in list
		index = i - low
		buckets[index] << i
	end

	output = []
	for i in buckets
		output.concat(merge_sort(i))
	end
	output
end

if __FILE__ == $PROGRAM_NAME
	# Generate random array of numbers
	if ARGV[0].nil?
		array = Array.new(5){|i| i + rand(25)}
	else
		array = Array.new(ARGV[0].to_i){|i| i + rand(25)}
	end
	puts "Unsorted Array"
	p array
	puts "Sorted by BucketSort"
	p bucket_sort(array,5)
end
