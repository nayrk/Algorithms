def merge_count_split(a,b)
	c = []
	inv = 0
	i = 0
	j = 0
	for k in 0..(a.size + b.size)-1
		if i < a.size and j < b.size
			if a[i] < b[j]
				c << a[i]
				i += 1
			elsif a[i] > b[j]
				c << b[j]
				inv += a.size - i
				j += 1
			end
		elsif i == a.size
				c << b[j]
				j += 1
		elsif j == b.size
				c << a[i]
				i += 1
		end
	end

	[c,inv]
end

def count_inv(data)
	n = data.size
	if n == 1
		return [data,0]
	end
	mid = n / 2
	left,right = [], []
	data.each_with_index do |value,index|
		value = value.to_i
		index < mid ? left << value : right << value
	end
	a, x = count_inv(left)
	b, y = count_inv(right)
	c, z = merge_count_split(a,b)
	return [c, x + y + z]
end

f = File.open("IntegerArray.txt")
list = f.read.split("\n")
p count_inv(list)[1]
