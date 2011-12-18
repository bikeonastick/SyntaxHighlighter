require 'test/unit'
require 'tools/syntaxhelper.rb'

class SHPackagerTest < Test::Unit::TestCase

	def test_JsSrcFile_basic
		name = 'shCore.js'
		tst = SyntaxHL::JsSrcFile.new(name)
		assert_equal(name,tst.file_name)

	end

	def test_CssSrcFile_basic
		name = 'shCore.css'
		tst = SyntaxHL::CssSrcFile.new(name)
		assert_equal(name,tst.file_name)
	end
	
	def test_SHBrush_basic
		lang = 'javascript'
		file_name = 'shBrushJScript.js'
		tst = SyntaxHL::SHBrush.new(lang,file_name)
		assert_equal(lang,tst.language)

	end

	# 
	# This test could be a little brittle if you name your project dir
	# something other than "SyntaxHighlighter." It's also expecting you
	# to run the test from the project's top dir...
	#
	def test_SyntaxHelper_getRootDir
		answer = Dir.pwd
		tst = SyntaxHL::SyntaxHLModel.new()
		assert_match(/.*\/SyntaxHighlighter/,tst.getRootDir())

		Dir.chdir("tools")
		assert_match(/.*\/SyntaxHighlighter/,tst.getRootDir())
	end
end

