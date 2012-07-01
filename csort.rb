# Counting Sort
def countingSort(array)
	y = array.inject(Array.new(array.size+1){0}) do |acc,i|
		acc[i] += 1
		acc
	end

	sorted = []
	y.each_with_index do |p,i|
		y[i].times { sorted << i }
	end

	sorted
end

def prompt(*args)
	print *args
	gets
end

if $PROGRAM_NAME == __FILE__
	
	if(!ARGV[0])
		n = prompt("Enter size of array: ").to_i
	else
		n = ARGV[0].to_i
	end

	array = []
	n = 5 if n < 1
	for i in 0...n
		array << 1 + rand(n)
	end

	puts "Non-Sorted Array : \n#{array}"
	puts "Sorted Array : "
	p countingSort(array)
end
