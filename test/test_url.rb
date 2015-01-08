require 'helper'

class TestURL < Test::Unit::TestCase
  context "The URL class" do

    should "throw an exception if neither permalink or template is specified" do
      assert_raises ArgumentError do
        URL.new(:placeholders => {})
      end
    end

    should "replace placeholders in templates" do
      assert_equal "/foo/bar", URL.new(
        :template => "/:x/:y",
        :placeholders => {:x => "foo", :y => "bar"}
      ).to_s
    end

    should "handle multiple of the same key in the template" do
      assert_equal '/foo/bar/foo/', URL.new(
        :template => "/:x/:y/:x/",
        :placeholders => {:x => "foo", :y => "bar"}
      ).to_s
    end

    should "use permalink if given" do
      assert_equal "/le/perma/link", URL.new(
        :template => "/:x/:y",
        :placeholders => {:x => "foo", :y => "bar"},
        :permalink => "/le/perma/link"
      ).to_s
    end

    should "replace placeholders in permalinks" do
      assert_equal "/foo/bar", URL.new(
        :template => "/baz",
        :permalink => "/:x/:y",
        :placeholders => {:x => "foo", :y => "bar"}
      ).to_s
    end

    should "handle multiple of the same key in the permalink" do
      assert_equal '/foo/bar/foo/', URL.new(
        :template => "/baz",
        :permalink => "/:x/:y/:x/",
        :placeholders => {:x => "foo", :y => "bar"}
      ).to_s
    end

    context "#sanitize_url" do
      should "not modify an acceptable url" do
        assert_equal '/foo/bar', Jekyll::URL.sanitize_url('/foo/bar')
      end

      should "not modify an acceptable url with a trailing slash" do
        assert_equal '/foo/bar/', Jekyll::URL.sanitize_url('/foo/bar/')
      end

      should "strip multiple slashes" do
        assert_equal '/foo/bar', Jekyll::URL.sanitize_url('//foo//bar')
      end

      should "add a leading slash if it's not there" do
        assert_equal '/foo/bar', Jekyll::URL.sanitize_url('foo/bar')
      end

      should "keep the trailing slash" do
        assert_equal '/foo/bar/', Jekyll::URL.sanitize_url('/foo//bar//')
      end

      should "remove segments consisting solely of dots" do
        assert_equal '/foo/bar/', Jekyll::URL.sanitize_url('/foo/../bar/')
      end

      should "remove dots at the end of the path" do
        assert_equal '/foo/bar/', Jekyll::URL.sanitize_url('/foo/bar/..')
      end

      should "remove dots at the end of the string" do
        assert_equal '/foo/bar/', Jekyll::URL.sanitize_url('/foo//bar/..')
      end

      should "remove dots at the beginning of the string" do
        assert_equal '/foo/bar/', Jekyll::URL.sanitize_url('../foo//bar/..')
      end
    end

  end
end
