module SyntaxHL
	# 
	# represents the syntax highlighter package. basically, a 
	# white box view of the syntax highlighter file structure
	#
	class SyntaxHLModel
		attr_reader :script_dir, :src_dir, :style_dir, 
			:test_dir, :tool_dir, :out_dir, :core_js
		# basedir
		# -scripts
		# -src
		# -styles
		# -tests
		# -tools
		# -out

		def initialize()
			@themes = Array.new()
			@brushes = Array.new()
			@root_dir = getRootDir()
			@script_dir = "#{@root_dir}/scripts"
			@src_dir = "#{@root_dir}/src"
			@style_dir = "#{@root_dir}/styles"
			@test_dir = "#{@root_dir}/tests"
			@tool_dir = "#{@root_dir}/tools"
			@out_dir = "#{@root_dir}/dist"
		end

		def getCoreJs()
			@core_js = SHBrush.new('core','shCore.js',self)
		end

		#
		# whether the program is run from a subdir or from the root dir
		# this should return the same answer as this script should be 
		# one dir down from the root directory. <root>/tools/syntaxhelper.rb
		#
		def getRootDir()
			file_loc = File.expand_path(__FILE__)
			re = /(.*)\/tools\/syntaxhelper.rb/
			md = re.match(file_loc)
			if ( md == nil )
				return file_loc
			end
			return md[1]
		end

		def getAvailableBrushLanguages()
			langs = Array.new()
			@brushes.each{ |lang|
				langs << lang
			}
		end

		def getAvailableThemeNames()
			names = Array.new()
			@themes.each{ |theme|
				names << theme.name
			}
		end

		# TODO: consider making this get the file JIT instead of having all
		# brushes captured at once in the beginning
		def getBrushByLanguage(lang)
			retVal = nil
			@brushes.each{ |brush|
				if ( lang == brush.language )
					retVal = brush
				end
			}

			return retVal
		end

		# TODO: consider making this get the file JIT instead of having all
		# themes captured at once in the beginning
		def getThemeByName(name)
			retVal = nil
			@themes.each{ |theme|
				if ( name == theme.name)
					retVal = theme
				end
			}

			return retVal
		end

		# Themes 
		# Default	shThemeDefault.css
		# Django	shThemeDjango.css
		# Eclipse	shThemeEclipse.css
		# Emacs	shThemeEmacs.css
		# Fade To Grey	shThemeFadeToGrey.css
		# Midnight	shThemeMidnight.css
		# RDark	shThemeRDark.css
		# TODO: programmatically extract this from source files
		#
		def gatherThemes()
			theme_data = Hash.new()
			theme_data['Default'] = 'shCoreDefault.css'
			theme_data['Django'] = 'shThemeDjango.css'
			theme_data['Eclipse'] = 'shThemeEclipse.css'
			theme_data['Emacs'] =	'shThemeEmacs.css'
			theme_data['Fade To Grey'] = 'shThemeFadeToGrey.css'
			theme_data['Midnight'] = 'shThemeMidnight.css'
			theme_data['RDark'] = 'shThemeRDark.css'

			theme_data.each{ |title,filename|
				@themes << SHTheme.new(title,filename,self)
			}
			
		end

		# brushes
		# ActionScript3	as3, actionscript3	shBrushAS3.js
		# Bash/shell	bash, shell	shBrushBash.js
		# ColdFusion	cf, coldfusion	shBrushColdFusion.js
		# C#	c-sharp, csharp	shBrushCSharp.js
		# C++	cpp, c	shBrushCpp.js
		# CSS	css	shBrushCss.js
		# Delphi	delphi, pas, pascal	shBrushDelphi.js
		# Diff	diff, patch	shBrushDiff.js
		# Erlang	erl, erlang	shBrushErlang.js
		# Groovy	groovy	shBrushGroovy.js
		# JavaScript	js, jscript, javascript	shBrushJScript.js
		# Java	java	shBrushJava.js
		# JavaFX	jfx, javafx	shBrushJavaFX.js
		# Perl	perl, pl	shBrushPerl.js
		# PHP	php	shBrushPhp.js
		# Plain Text	plain, text	shBrushPlain.js
		# PowerShell	ps, powershell	shBrushPowerShell.js
		# Python	py, python	shBrushPython.js
		# Ruby	rails, ror, ruby	shBrushRuby.js
		# Scala	scala	shBrushScala.js
		# SQL	sql	shBrushSql.js
		# Visual Basic	vb, vbnet	shBrushVb.js
		# XML	xml, xhtml, xslt, html, xhtml	shBrushXml.js
		# TODO: programmatically extract this from source files
		#
		def gatherBrushes()
			brush = SHBrush.new('ActionScript3','shBrushAS3.js',self)	
			brush.aliases = ['as3', 'actionscript3']
			@brushes << brush

			brush = SHBrush.new('Bash/shell','shBrushBash.js',self)	
			brush.aliases = ['bash', 'shell']
			@brushes << brush

			brush = SHBrush.new('ColdFusion	','shBrushColdFusion.js',self)	
			brush.aliases = ['cf', 'coldfusion']
			@brushes << brush

			brush = SHBrush.new('C#','shBrushCSharp.js',self)	
			brush.aliases = ['c-sharp', 'csharp']
			@brushes << brush

			brush = SHBrush.new('C++','shBrushCpp.js',self)	
			brush.aliases = ['cpp', 'c']
			@brushes << brush

			brush = SHBrush.new('CSS','shBrushCss.js',self)	
			brush.aliases = ['css']
			@brushes << brush

			brush = SHBrush.new('Delphi','shBrushDelphi.js',self)	
			brush.aliases = ['delphi', 'pas', 'pascal']
			@brushes << brush

			brush = SHBrush.new('Diff','shBrushDiff.js',self)	
			brush.aliases = ['diff', 'patch']
			@brushes << brush

			brush = SHBrush.new('Erlang','shBrushErlang.js',self)	
			brush.aliases = ['erl', 'erlang']
			@brushes << brush

			brush = SHBrush.new('Groovy','shBrushGroovy.js',self)	
			brush.aliases = ['groovy']
			@brushes << brush

			brush = SHBrush.new('JavaScript','shBrushJScript.js',self)	
			brush.aliases = ['js', 'jscript', 'javascript']
			@brushes << brush

			brush = SHBrush.new('Java','shBrushJava.js',self)	
			brush.aliases = ['java']
			@brushes << brush

			brush = SHBrush.new('JavaFX','shBrushJavaFX.js',self)	
			brush.aliases = ['jfx', 'javafx']
			@brushes << brush

			brush = SHBrush.new('Perl','shBrushPerl.js',self)	
			brush.aliases = ['perl', 'pl']
			@brushes << brush

			brush = SHBrush.new('PHP','shBrushPhp.js',self)	
			brush.aliases = ['php']
			@brushes << brush

			brush = SHBrush.new('Plain Text','shBrushPlain.js',self)	
			brush.aliases = ['plain', 'text']
			@brushes << brush

			brush = SHBrush.new('PowerShell','shBrushPowerShell.js',self)	
			brush.aliases = ['ps', 'powershell']
			@brushes << brush

			brush = SHBrush.new('Python','shBrushPython.js',self)	
			brush.aliases = ['py', 'python']
			@brushes << brush

			brush = SHBrush.new('Ruby','shBrushRuby.js',self)	
			brush.aliases = ['rails', 'ror', 'ruby']
			@brushes << brush

			brush = SHBrush.new('Scala','shBrushScala.js',self)	
			brush.aliases = ['scala']
			@brushes << brush

			brush = SHBrush.new('SQL','shBrushSql.js',self)	
			brush.aliases = ['sql']
			@brushes << brush

			brush = SHBrush.new('Visual Basic','shBrushVb.js',self)	
			brush.aliases = ['vb', 'vbnet']
			@brushes << brush

			brush = SHBrush.new('XML','shBrushXml.js',self)	
			brush.aliases = ['xml', 'xhtml', 'xslt', 'html', 'xhtml']
			@brushes << brush
		end
	end

	class SHBrush
		attr_accessor :language, :aliases, :js_file
		def initialize(lang,file_name,sh)
			@language = lang
			@js_file = JsSrcFile.new(file_name,sh.getRootDir())
		end

		def to_s
			@str = @js_file.to_s
		end
	end

	class SHTheme
		attr_accessor :name, :css_file

		def initialize(name,file_name,sh)
			@name = name
			@css_file = CssSrcFile.new(file_name,sh.getRootDir())
		end

		def to_s
			@str = @css_file.to_s
		end
	end
	
	class SrcFile 
		attr_reader :file_name, :open_src_comment, :close_src_comment, 
			:open_html_comment, :close_html_comment


		def initialize(file_name,dir_name)
			@file_name = file_name
			@dir_name = dir_name
			@src_file = File.new("#{@dir_name}/#{@file_name}",'r')
			@open_src_comment = "/*"
			@close_src_comment = "*/"
			@open_html_comment = "<!--"
			@close_html_comment = "-->"
		end

		def to_s
			lines = @src_file.readlines()
			line_str = lines.join()
		end

	end

	class JsSrcFile < SrcFile
		def initialize(file_name,root_dir)
			super(file_name,"#{root_dir}/scripts")
			@file_name = file_name
			@open_tag = "<script type=\"text/javascript\">"
			@close_tag= "</script>"
		end

		def to_s
			str = @open_tag 
			str << "\n"
			str << @open_html_comment
			str << "\n"
			str << @open_src_comment
			str << " "
			str << @file_name
			str << " "
			str << @close_src_comment
			str << "\n"
			str << super.to_s
			str << '//'
			str << @close_html_comment
			str << @close_tag
		end

	end

	class CssSrcFile < SrcFile

		def initialize(file_name,root_dir)
			super(file_name,"#{root_dir}/styles")
			@open_tag = "<style type=\"text/css\">"
			@close_tag= "</style>"
		end

		def to_s
			str = @open_tag 
			str << "\n"
			str << @open_src_comment
			str << " "
			str << @file_name
			str << " "
			str << @close_src_comment
			str << "\n"
			str << super.to_s
			str << @close_tag
		end
	end
end
