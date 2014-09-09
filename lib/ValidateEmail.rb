require 'resolv'

module ValidateEmail
  def self.validate(email, validate_mx = false)
    email_pattern = (email =~ /^[\w\+-][\w\.\+-]*[\w\+-]@[A-Z0-9][A-Z0-9\.-]*[A-Z0-9]\.[A-Z][A-Z\.]*[A-Z]$/i)
    is_valid = email_pattern.nil? ? false : true
    is_valid = validate_mx_record(email) if is_valid && validate_mx

    return is_valid
  end

  def self.validate_mx_record(email)
    domain = email.match(/\@(.+)/)[1]
    Resolv::DNS.open do |dns|
      @mx = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
    end
    @mx.size > 0 ? true : false
  end
end
