# Inversion Count without Divide and Conquer
# Runtime O(n^2)
def inversions(list=nil)
	return if list.nil?

	count = 0
	list.each_with_index do |i,x|
		list.each_with_index do |j,y|
			count += 1 if (i > j) and (x < y)
		end
	end
	count
end

# Inversion Count with Divide and Conquer
# Total Runtime O(n log n)
def inversions2(list=nil,length=list.size)
	return [list,0] if length == 1
	mid = length / 2
	left,right = [], []
	list.each_with_index do |value,index|
		value = value.to_i
		index < mid ? left << value : right << value
	end
	a,x = inversions2(left)
	b,y = inversions2(right)
	d,z = splitInv(a,b,list.length)
	[d,(x + y + z)]
end

# Using Merge from MergeSort to count inversions
# Runtime O(n) of subroutine
def splitInv(a,b,length=a.size+b.size)
	d = []
	count = 0
	until a.empty? or b.empty?
		if a.first < b.first
			d << a.shift
		else
			d << b.shift
			count += a.size
		end
	end
	d.concat(a).concat(b)
	[d,count]
end

if __FILE__ == $PROGRAM_NAME
	file = File.open(ARGV[0])
	lines = file.read.split("\n")
	p inversions2(lines)[1]
end
