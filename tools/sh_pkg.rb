module SHPackager

	# 
	# this is the model of what we'll print out
	#
	class PackageModel
		attr_accessor :corejs, :brushjs, :css, :entrypoint

		def initialize(brush,style)
			@entrypoint = "<script type=\"text/javascript\">SyntaxHighlighter.all();</script>"
			@corejs_loc = "scripts/shCore.js"
			@brush = brush
			@style = style
			@sh = SyntaxHelper.new()
		end
	end


end
