# Ruby Parser für ein Textadventure

require 'treetop'

base_path = File.expand_path(File.dirname("C:\Users\Alexander\Desktop\Schule\Info\FA\Programm"))

require File.join(base_path, 'node_extensions.rb')

class Parser

	Treetop.load(File.join(base_path, 'sexp_parser.treetop'))
	@@parser = SexpParser.new
	
	def self.parse(data)
		tree = @@parser.parse(data)
		
		if(tree.nil?)
			raise Exception, "Parse error at offset: #{@@parser.index}"
		end
		
		self.clean_tree(tree)
		
		return tree.to_array
	end
	
	private
		
		def self.clean_tree(root_node)
			return if(root_node.elements.nil?)
			root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::Syntaxnode" }
			root_node.elements.each {|node| self.clean_tree(node)}
		end
	
end

Parser.parse('this is a test 1 2.3')

gets.chomp