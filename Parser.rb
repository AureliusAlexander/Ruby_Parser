# Ruby Parser für ein Textadventure
require 'treetop'

base_path = File.expand_path(File."C:\Users\Alexander\Desktop\Schule\Info\FA\Programm"(__FILE__))

require File.join(base_path, 'node_extensions.rb')

class Parser

	Treetop.load(File.join(base_path, 'sexp_parser.treetop'))
	@@parser = SexpParser.new
	
	def self.parse(data)
		tree = @@parse(data)
		
		if(tree.nil?)
			raise Exception, "Parse error at offset: #{@@parser.index}"
		end
		
		return tree
	end
	
end