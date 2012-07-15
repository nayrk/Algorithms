# Kosaraju's Algorithm

# Global variables
$time = 0
$source = nil
$explored = []
$leader = {}
$finishing_time = {}

def clearGlobals
	$time = 0
	$source = nil
	$explored = []
	$leader = {}
	$finishing_time = {}
end

# Depth First Search (DFS)
# i = node
def dfs(graph, i)
	# Mark explored
	#$explored << i
	#$leader[i] = $source

	# Iterative DFS
	stack = [i]
	until stack.empty?
		i = stack.last
		$leader[i] = $source
		if $explored.include? i
			$time += 1
			$finishing_time[i] = $time
			stack.pop
		else
			neighbors = []
			$explored << i
			if graph[i]
				graph[i].each do |l|
					neighbors << l unless $explored.include? l
				end
			end
			if neighbors.empty?
				$time += 1
				$finishing_time[i] = $time
				stack.pop
			else
				stack.concat(neighbors)
			end
		end
	end

	#unless graph[i].nil?
	#	graph[i].each do |node|
	#		unless $explored.include? node
	#			dfs(graph,node)
	#		end
	#	end

	#	$time += 1
	#	$finishing_time[i] = $time
	#end
end

def dfs_loop(graph)
	n = graph.keys.collect { |i| i.to_i }.sort_by { |i| -i }
	n.each do |i|
		unless $explored.include? i
			$source = i
			dfs(graph,i)
		end
	end
end

if __FILE__ == $PROGRAM_NAME

	# Graph
	graph = {}
	# Transposed Graph
	graph_t = {}

	File.open('SCC3.txt').read.split("\n").each do |line|
		from, to = line.split(" ")
		from = from.to_i
		to = to.to_i
		(graph[from] ||= []) << to
		(graph_t[to] ||= []) << from
	end

	# Kosaraju's Algorithm
	# Calculate time on transpose
	dfs_loop(graph_t)	

	# Build new graph with finishing times using arcs from original graph
	graph_n = {}
	for i in 1..$finishing_time.size
		i = i.to_i
		graph_n[$finishing_time[i]] = graph[i].collect { |x| x = x.to_i; $finishing_time[x] }
	end

	# Run Kosaraju's Algorithm again on new graph
	clearGlobals
	dfs_loop(graph_n)

	# Calculate leaders
	leaders = $leader.keys.inject(Hash.new(0)) do |acc,k|
		acc[$leader[k]] += 1
		acc
	end

	# Print the top 5 SCC count
	leaders.keys.last(5).each do |key|
		p leaders[key]
	end
end
