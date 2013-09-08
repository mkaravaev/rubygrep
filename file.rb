module RubyGrep
	
	
	class File

		attr_reader :filename, :pattern

		def initialize(fn, directory)
			@filename = fn
			@contents = ::File.readlines("#{@filename}")
			@pattern  = directory.pattern
		end

		def lines
			return @lines if @lines
			@contents.delete_if { |s| !s.match(@pattern)}
			@lines = []
			@contents.map.each_with_index { |s,i| @lines << Line.new(i,s,self)}
			@lines
		end

		def print_lines
			unless lines.empty?
				puts @filename
				lines.each { |l| puts "  #{l.to_s}"}
			end
		end

	end	
	
end