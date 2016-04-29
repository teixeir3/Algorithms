#   # Email regex used to validate email formats. It simply asserts that
  # an one (and only one) @ exists in the given string. This is mainly
  # to give user feedback and not to assert the e-mail validity.
  # config.email_regexp = /\A[^@]+@[^@]+\z/
  
  # SOURCES: 
  # http://ruby-doc.org/core-2.2.0/Regexp.html
  # http://emailregex.com/
  
  # Regexp
 #
 #  A Regexp holds a regular expression, used to match a pattern against strings. Regexps are created using the /.../ and %r{...} literals, and by the Regexp::new constructor.
 #
 #  Regular expressions (regexps) are patterns which describe the contents of a string. They’re used for testing whether a string contains a given pattern, or extracting the portions that match. They are created with the /pat/ and %r{pat} literals or the Regexp.new constructor.
 #
 #  A regexp is usually delimited with forward slashes (/).

require 'faker'
value = 
# regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
value =~ regex

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-\d]+(\.[a-z]+)*\.[a-z]+\z/i
# \\ declares a regular expression pattern
# \A[\w+\-.]+ = the username part of the email address
# /A = matches beginning of string
# [/w+/-.] = matches any number of words (\/w+\), - character(\/-\), or any single character 1 or more times besides a new line (\.\)
# + after [\w+\-.] means that whatever is matched inside must be matched 1 or more times.
# @ = @ symbol of the email address to declare username@domain.domainextension
# [a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i = the domain name
# [a-z\d\-]+ = any letter a-z ([a-z]), digit character (\/d\), or - character (\/-\) any number of times (+). This is the domain name without the domain extension (ayosinformatics in doug@ayosinformatics.com)
# (\.[a-z]+)* = () capture what's inside. \. is a period character followed by any letter any number of times([a-z]+), the whole capture must occur at least 0 times
# \. is a period character
# [a-z]+ is any letter character 1 or more times.
# \. is a period character
# [a-z]+ is any letter character 1 or more times.
#  \z matches the end of the string (meaning this has to be the last part of the email address)
# i after a /.../ regex means to ignore case. We use this because emails aren't case sensitive.

# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

def valid_email?(email_str)
  !(email_str =~ VALID_EMAIL_REGEX).nil?
end

100.times do |i| puts valid_email?(Faker::Internet.email) end

if __FILE__ == $PROGRAM_NAME
  # provide file name on command line
  # p WordChainer.new(ARGV.shift).run("duck", "ruby")
end

# class EmailValidator < ActiveModel::EachValidator
#   CRAZY_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#
#   def validate_each(record, attribute_name, value)
#     unless value =~ CRAZY_EMAIL_REGEX
#       # we can use `EachValidator#options` to access custom options
#       # passed to the validator.
#       message = options[:message] || "is not an email"
#       record.errors[attribute_name] << message
#     end
#   end
# end
#
# # app/models/person.rb
# class Person < ActiveRecord::Base
#   # Rails knows `:email` means `EmailValidator`.
#   validates :email, :presence => true, :email => true
#   # not required, but must also be an email
#   validates :backup_email, :email => {:message => "isn't even valid"}
# end


