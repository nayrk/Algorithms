# 2-Sum Product
def sumProduct(hash,t)
	for x in hash.keys
		next if x == t-x
		break if x >= t
		return 1 if hash[t-x]
	end
	0
end

if __FILE__ == $PROGRAM_NAME
	MAX = 10000000
	file = File.open('./HashInt.txt').read.split("\n").map {|e| e.to_i}.sort

	hash = file.inject(Hash.new) do |arr,i|
		arr[i] = true
		arr
	end

	count = 0
	(2500..4000).each do |t|
		count += sumProduct(hash,t)
	end
	p count
end
