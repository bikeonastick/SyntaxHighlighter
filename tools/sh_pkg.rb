module SHPackager

	# 
	# this is the model of what we'll print out
	#
	class PackageModel
		attr_accessor :corejs, :brushjs, :css, :entrypoint
		attr_reader :avail_brush_langs, :avail_themes

		def initialize(brush,style)
			@entrypoint = "<script type=\"text/javascript\">SyntaxHighlighter.all();</script>"
			@brush = brush
			@style = style
			@sh = SyntaxHL::SyntaxHLModel.new()
			@sh.gatherThemes()
			@sh.gatherBrushes()
			@avail_brush_langs = @sh.getAvailableBrushLanguages()
			@avail_themes = @sh.getAvailableThemeNames()
			
		end

		def to_s
			@corejs = @sh.getCoreJs()
			@brushjs = @sh.getBrushByLanguage(@brush)
			@css = @sh.getThemeByName(@style)
			@example_pre = "<pre class=\"brush: #{@brushjs.aliases[0]};\"> //your code goes here </pre>"

			str = @corejs.to_s
			str << "\n\n"
			str << @brushjs.to_s
			str << "\n\n"
			str << @css.to_s
			str << "\n\n"
			str << @entrypoint
			str << "\n\n"
			str << "<h1>your blog goes here</h1>"
			str << "\n\n"
			str << @example_pre
			str << "<h2>and some more here</h2>"
		end

		def to_f
			if( !File.exists?(@sh.out_dir))
				Dir.mkdir(@sh.out_dir)
			end
			out_name = Time.now.to_i
			File.open(File.join(@sh.out_dir,"#{out_name}.txt"),'w') do |f|
				f.puts self.to_s 
			end
		end
	end
# <script type="text/javascript" src="scripts/shCore.js"></script>
#	<script type="text/javascript" src="scripts/shBrushJScript.js"></script>
#	<link type="text/css" rel="stylesheet" href="styles/shCoreDefault.css"/>
# <script type="text/javascript">SyntaxHighlighter.all();</script>

end
