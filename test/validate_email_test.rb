$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'ValidateEmail'

class ValidateEmailTest < Test::Unit::TestCase
  def test_validat_email
    assert_not_valid("bvsatyaram")
    assert_not_valid("bvsatyaram@example")
    assert_not_valid("bvsatyaram.com")
    assert_valid("bvsatyaram@example.com")
    assert_valid("bv_satyaram@example.com")
    assert_valid("bv.satyaram@example.com")
    assert_valid("bv-satyaram@example.com")
    assert_valid("bvsatyaram@example.org")
    assert_valid("bvsatyaram@fhgtrityhgs.com")

    assert_valid("bvsatyaram+nospam@example.com")
    assert_valid("1bvsatyaram@example.com")
    assert_valid("_bvsatyaram@example.com")
    assert_valid("bvsatyaram@ex-ample.com")
    assert_valid("bvsatyaram@my-host.ex-ample.com")
    assert_not_valid("bvsatyaram@example..com")
    assert_not_valid("bvsatyaram@ex_ample.com")

    assert_not_valid("bvsatyaram", true)
    assert_not_valid("bvsatyaram@example", true)
    assert_not_valid("bvsatyaram.com", true)
    assert_valid("bvsatyaram@bvsatyaram.com", true)
    assert_valid("bv_satyaram@bvsatyaram.com", true)
    assert_valid("bv.satyaram@bvsatyaram.com", true)
    assert_valid("bv-satyaram@bvsatyaram.com", true)
    assert_valid("bvsatyaram@rubygems.org", true)
    assert_valid("bv12.satyaram@rubygems.org", true)
    assert_valid("bvsatyaram+google@bvsatyaram.com", true)
    assert_valid("bv.satya_ram-123+google123@bvsatyaram.com", true)
    assert_not_valid("bvsatyaram@fhgtrityhgs.com", true)
  end

  private
  def assert_valid(email, validate_mx = nil)
    if validate_mx.nil?
      assert_equal true, ValidateEmail.validate(email)
    else
      assert_equal true, ValidateEmail.validate(email, validate_mx)
    end
  end

  def assert_not_valid(email, validate_mx = nil)
    if validate_mx.nil?
      assert_equal false, ValidateEmail.validate(email)
    else
      assert_equal false, ValidateEmail.validate(email, validate_mx)
    end
  end
end
