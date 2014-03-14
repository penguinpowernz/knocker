require 'knocker'

def config
  <<-EOF
# Knocker config file
# keep this secret, knock patterns are almost like passwords
pattern pvtchatops
  host myvps.example.com
  u 5445
  t 4456
  t 63854
  c xchat --url=irc://$host:36777/chatops
  EOF
end