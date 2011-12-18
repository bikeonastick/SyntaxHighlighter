module SyntaxHL
	# 
	# represents the syntax highlighter package. basically, a 
	# white box view of the syntax highlighter file structure
	#
	class SyntaxHLModel
		attr_reader :script_dir, :src_dir, :style_dir, 
			:test_dir, :tool_dir, :out_dir
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

		#
		# whether the program is run from a subdir or from the root dir
		# this should return the same answer
		#
		def getRootDir()
			file_loc = File.expand_path(File.dirname(File.dirname(__FILE__)))
		end
		# Themes 
		# Default	shThemeDefault.css
		# Django	shThemeDjango.css
		# Eclipse	shThemeEclipse.css
		# Emacs	shThemeEmacs.css
		# Fade To Grey	shThemeFadeToGrey.css
		# Midnight	shThemeMidnight.css
		# RDark	shThemeRDark.css
		#

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
	end

	class SHBrush
		attr_accessor :language, :aliases, :js_file
		def initialize(lang,file_name)
			@language = lang
			@js_file = JsSrcFile.new(file_name)
		end
	end

	class SHTheme
		attr_accessor :name, :css_file
		attr_reader :file_name

		def initialize(name,file_name,sh)
			@name = name
			@file_name = filename
	
		end
	end
	class SrcFile 
		attr_reader :file_name 

		@open_src_comment = "/*"
		@close_src_comment = "*/"
		@open_html_comment = "<!--"
		@close_html_comment = "-->"

		def initialize(file_name,dir_name)
			@dir_name = dir_name
			@file_name = file_name
			@src_file = File.new("#{@dir_name}/#{@file_name}",'r')
		end

	end

	class JsSrcFile < SrcFile
		@open_tag = "<script type=\"text/javascript\">"
		@close_tag= "</script>"
		def initialize(file_name)
			super(file_name,"scripts")
		end
	end

	class CssSrcFile < SrcFile
		@open_tag = "<style type=\"text/css\">"
		@close_tag= "</style>"

		def initialize(file_name)
			super(file_name,"styles")
		end
	end
end
