module RubyGrep

	class Directory

		attr_reader :pattern

		def initialize(path, pattern) #/Users/misha/Rails/rubygrep
			@path = path
			@entries = Dir.entries(path)
			@pattern = pattern
			read_contents
		end

		def print_files
			@files.each 	{ |f| f.print_lines }
			@folders.each { |d| d.print_files }
		end

		private

			def read_contents
				@files = []
				@folders = []
				@entries.delete_if { |e| e.match(/^\.\.?$/) }
				@entries.each do |entry| 
					if ::File.directory?(@path + "/" + entry)
						@folders << Directory.new(@path + "/" + entry, pattern) # sample
						#/Users/misha/Rails/rubygrep/sample
					elsif                                       
						@files << File.new(@path + "/" + entry, self)
					end
				end
			end
		


	end
end