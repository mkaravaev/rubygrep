module RubyGrep

	class Line

		require 'colorize'

		attr_reader :contents

		def initialize(n,s,file)
			@contents = s
			@number 	= n
			@file			= file
		end

		def to_s
			"#{@number}:" + " #{@contents.strip} ".red
		end

	end

end