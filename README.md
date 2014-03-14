# Knocker

I wanted to use knock servers but wasn't sure how to remember all the knock patterns, plus I pretty much always want to run specific commands straight after knocking.

I also love `.ssh/config` files (if you don't use one, you are missing out!), so simple yet so powerful.

## Installation

Add this line to your application's Gemfile:

    gem 'knocker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install knocker

## Usage

Like an SSH config is powerful for connecting to SSH daemons:

```
# SSH config file
Host myvps
  Hostname vps.example.com
  User robert
  Port 22022
  DynamicForward 50000
  LocalForward 3000:localhost:3000
  ForwardX11 yes
```

I want knocker to be powerful for connecting to knock daemons:

Each config file stores knock patterns which include:

* hostname
* knock specs
* commands to run after knocking

```
# Knocker config file
# keep this secret, knock patterns are almost like passwords
pattern pvtchatops
  h myvps.example.com
  u 5445
  t 4456
  t 63854
  c xchat --url=irc://$host:36777/chatops
```

So when you run `nkr pvtchatops` it actually runs two commands:

* The knock client command: `knock myvps.example.com 5445:udp 4456:tcp 63854:tcp`
* The post command: `xchat --url=irc://myvps.example.com:36777/chatops`

Easy!

### The rules

As you saw, the config syntax is simple.

* use pattern and a name to name the pattern
* h and then the hostname/ip to connect to
* t and the port number for a tcp knock (multiples allowed)
* u and the port number for a udp knock (multiples allowed)
* c and the command to run after knocking (multiples allowed)
* on command lines use $host to use host defined for the pattern

**Mix this with SSH config files and you will an unstoppable sysadmin!**

**KEEP THE CONFIG FILE SECRET!!!**

## Contributing

1. Fork it ( http://github.com/penguinpowernz/knocker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
