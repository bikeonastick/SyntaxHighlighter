require 'test/unit'
require 'tools/syntaxhelper.rb'

class SHPackagerTest < Test::Unit::TestCase
	
	# 
	# This test could be a little brittle if you name your project dir
	# something other than "SyntaxHighlighter." It's also expecting you
	# to run the test from the project's top dir...
	#
	def test_SyntaxHelper_getRootDir
		answer = Dir.pwd
		tst = SyntaxHL::SyntaxHLModel.new()
		assert_match(/.*\/SyntaxHighlighter$/,tst.getRootDir())

	end

	def test_SyntaxHelper_gatherThemes
		tst = SyntaxHL::SyntaxHLModel.new()
		tst_themes = tst.gatherThemes()
		assert_equal(7,tst_themes.length)
	end

	def test_SyntaxHelper_gatherBrushes
		tst = SyntaxHL::SyntaxHLModel.new()
		tst_brushes = tst.gatherBrushes()
		assert_equal(23,tst_brushes.length)
	end

	def test_SyntaxHelper_getThemeByName
		tst = SyntaxHL::SyntaxHLModel.new()
		tst_themes = tst.gatherThemes()
		tst_name = "Django" 
		tst_theme= tst.getThemeByName(tst_name)
		assert_equal(tst_name,tst_theme.name)
	end

	def test_SyntaxHelper_getBrushByLanguage
		tst = SyntaxHL::SyntaxHLModel.new()
		tst.gatherBrushes()
		tst_lang = "Java" 
		tst_brush = tst.getBrushByLanguage(tst_lang)
		assert_equal(tst_lang,tst_brush.language)
	end

	def test_SyntaxHelper_getBrushByLanguage2
		tst = SyntaxHL::SyntaxHLModel.new()
		tst.gatherBrushes()
		tst_lang = "Foo" 
		tst_brush = tst.getBrushByLanguage(tst_lang)
		assert_nil(tst_brush)
	end

	def test_JsSrcFile_basic
		sh = SyntaxHL::SyntaxHLModel.new()
		name = 'shCore.js'
		tst = SyntaxHL::JsSrcFile.new(name,sh.getRootDir())
		assert_equal(name,tst.file_name)
	end

	def test_CssSrcFile_basic
		sh = SyntaxHL::SyntaxHLModel.new()
		name = 'shCore.css'
		tst = SyntaxHL::CssSrcFile.new(name,sh.getRootDir())
		assert_equal(name,tst.file_name)
	end
	
	def test_SHBrush_basic
		lang = 'javascript'
		file_name = 'shBrushJScript.js'
		tst = SyntaxHL::SHBrush.new(lang,file_name,SyntaxHL::SyntaxHLModel.new())
		assert_equal(lang,tst.language)

	end

	def test_SHTheme_basic
		name = 'Default'
		file_name = 'shThemeDefault.css'
		tst = SyntaxHL::SHTheme.new(name,file_name,SyntaxHL::SyntaxHLModel.new())
		assert_equal(name,tst.name)
	end

	# uncomment to test printing out a file too much output for regular testing
	#def test_JsSrcFile_to_s
	#	sh = SyntaxHL::SyntaxHLModel.new()
	#	name = 'shCore.js'
	#	tst = SyntaxHL::JsSrcFile.new(name,sh.getRootDir())
	#	assert_nothing_raised do
	#		puts tst.to_s
	#	end
	end

end

