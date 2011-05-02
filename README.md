ValidateEmail
=============

`ValidateEmail` gem is the ultimate email validator. It not only validates email address by `Regex` check but also optionally checks for the MX records.

Installation
------------

  gem install ValidateEmail

Usage
-----

  require 'rubygems'
  require 'ValidateEmail'

You may validate an email address using Regex check by running:
 
  ValidateEmail.validate("bvsatyaram@example.com")

You may also validate email address by both checking the Regex and also the MX record by running:

  ValidateEmail.validate("bvsatyaram@noexisting.domain", true)

The `ValidateEmail.validate` method returns a boolean. So, we can have some thing as follows:

  user.email = email unless ValidateEmail.validate(email)

Author
------

B V Satyaram <[bvsatyaram.com][http://bvsatyaram.com]>

