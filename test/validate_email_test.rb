$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'ValidateEmail'

class ValidateEmailTest < Test::Unit::TestCase
  def test_validat_email
    assert !ValidateEmail.validate("bvsatyaram")
    assert !ValidateEmail.validate("bvsatyaram@example")
    assert !ValidateEmail.validate("bvsatyaram.com")
    assert ValidateEmail.validate("bvsatyaram@example.com")
    assert ValidateEmail.validate("bv_satyaram@example.com")
    assert ValidateEmail.validate("bv.satyaram@example.com")
    assert ValidateEmail.validate("bv-satyaram@example.com")
    assert ValidateEmail.validate("bvsatyaram@example.org")
    assert ValidateEmail.validate("bvsatyaram@fhgtrityhgs.com")

    assert !ValidateEmail.validate("bvsatyaram", true)
    assert !ValidateEmail.validate("bvsatyaram@example", true)
    assert !ValidateEmail.validate("bvsatyaram.com", true)
    assert ValidateEmail.validate("bvsatyaram@bvsatyaram.com", true)
    assert ValidateEmail.validate("bv_satyaram@bvsatyaram.com", true)
    assert ValidateEmail.validate("bv.satyaram@bvsatyaram.com", true)
    assert ValidateEmail.validate("bv-satyaram@bvsatyaram.com", true)
    assert ValidateEmail.validate("bvsatyaram@rubygems.org", true)
    assert !ValidateEmail.validate("bvsatyaram@fhgtrityhgs.com", true)
  end
end
