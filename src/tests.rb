require 'test/unit'

require_relative "zip"
require_relative "fragment"


class ZipTest < Test::Unit::TestCase
  # def setup
  # end
  # def teardown
  # end

  def test_all
    v = ["def a = b;", "Magrathea", "Unidade de testes != makefile"]
    for i in v
      assert Zip.dezip(Zip.zip(i)) == i
    end
  end
end

class FragmentTest < Test::Unit::TestCase

  def test_create
    name = "TestePequeno.py"
    source = "print 2+2"

    f = Fragment.new name, source

    f.create

    f1 = Fragment.get f.id

    assert f1.id == f.id
    assert f1.source == f.source
    assert f1.name == f.name
  end

  def test_delete
    name = "TestePequeno.py"
    source = "print 2+2"

    f = Fragment.new name, source
    f.create
    f.delete

    f = Fragment.get f.id
    assert f==nil
  end

  def test_update
    name = "TestePequeno.py"
    source = "print 2+2"

    f = Fragment.new name, source
    f.create

    source = "print 2+3"
    f.source = source
    f.update

    f = Fragment.get f.id
    assert f.source == source
  end

  def test_language
    name = "TestePequeno.py"
    source = "print 2+2"

    f = Fragment.new name, source
    f.create
    puts f.lang
    assert f.lang==:python
  end

end
