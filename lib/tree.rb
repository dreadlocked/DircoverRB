require 'uri'
require 'tree'
require_relative './colorize.rb'

#
# Class which represents a path tree structure using URL as input
#
class UrlPathTree
	attr_accessor :root

	#
	# Initialize a tree structure with a ROOT node
	#
	def initialize
		@root = Tree::TreeNode.new("ROOT")
	end

	#
	# Convert http://www.example.com/01/02/03 into [www.examle.com,01,02,03]
	#
	def prepare_uri(uri)
		uri = URI(uri)
		path_array = []
		path_array.push(uri.host)

		uri.path.split('/').each do |path|
			if path != ""
				path_array.push(path)
			end
		end
		return path_array
	end

	#
	# Adds a node into tree structure, checks if node already exists
	#
	def add(uri)
		
		path_array = prepare_uri(uri)
		path_node = Tree::TreeNode.new(path_array[0])

		if @root[path_array[0]] == nil
			@root << path_node
		else
			path_node = @root[path_node.name]
		end

		if path_array.length > 1
			for i in 1..path_array.length-1 do
				child_node = Tree::TreeNode.new(path_array[i])

				if path_node[child_node.name] == nil
					path_node << child_node
					path_node = child_node
				else
					path_node = path_node[child_node.name]
				end
			end
		end
	end

	def colorize_output(depth,string)
		case depth
			when 1 
				return string.green.bold
			when 2
			 return string.yellow
			when 3 
				return string.cyan
			when 4 
				return string.blue
			when 5
				return string.magenta
			when 6
				return string.red
			when 7
				return string.gray
			else
				return string
		end
	end

	#
	# Print the whole tree on a not so fashon way, need to be improved, 
	# use different colors for each level, that's cool
	#
	def print(node)
		instance = self
		if node != nil
			if node.name != "ROOT"
				if node.node_depth == 1
					puts ""
				end
				puts colorize_output(node.node_depth,"─"*node.node_depth + " " + node.name)
			end
			childs_ids = node.children
			childs_ids.each do |child_id|
				instance.print(node[child_id.name])	
			end
		end
	end
end