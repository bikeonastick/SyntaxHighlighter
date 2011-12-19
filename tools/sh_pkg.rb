module SHPackager

	# 
	# this is the model of what we'll print out
	#
	class PackageModel
		attr_accessor :corejs, :brushjs, :css, :entrypoint

		def initialize(brush,style)
			@entrypoint = "<script type=\"text/javascript\">SyntaxHighlighter.all();</script>"
			@brush = brush
			@style = style
			@sh = SyntaxHelper.new()
			@sh.gatherThemes()
			@sh.gatherBrushes()
			@corejs = @sh.getCoreJs()
			
		end
	end
# <script type="text/javascript" src="scripts/shCore.js"></script>
#	<script type="text/javascript" src="scripts/shBrushJScript.js"></script>
#	<link type="text/css" rel="stylesheet" href="styles/shCoreDefault.css"/>
# <script type="text/javascript">SyntaxHighlighter.all();</script>

end
