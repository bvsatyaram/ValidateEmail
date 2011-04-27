require 'resolv'

module ValidateEmail
  def self.validate(email, validate_mx = false)
    email_pattern = (email =~ /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/)
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
