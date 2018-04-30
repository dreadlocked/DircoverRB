## DircoverRB: Passive subdomains and web directories recon using Bing.

DircoverRB is a tool made to discover directories and subdomains for a domain using Bing (Google doesn't like scrappers). I made this tool because many domains use wildcards and this difficult subdomains discovery tasks. Using Bing dork "site:" allowed me to discover not only subdomains but directories too.

#### Dependencies
DircoverRB dependents on *nokogiri* and *rubytree*, maybe in the future this dependencies could be removed.

#### Install & usage
```
$ git clone https://github.com/dreadlocked/DircoverRB.git
$ cd DircoverRB
$ bundle install
$ ruby dircover.rb -h example.com
```

#### Output example