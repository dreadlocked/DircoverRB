## DircoverRB: Passive subdomains and web directories recon using Bing.

DircoverRB is a tool made to discover directories and subdomains for a domain using Bing (Google doesn't like scrappers). I made this tool because many domains use wildcards and this difficult subdomains discovery tasks. Using Bing dork "site:" allowed me to discover not only subdomains but directories too.

#### Dependencies
DircoverRB dependents on *nokogiri* and *rubytree*, maybe in the future this dependencies could be removed.

#### Install
```
$ git clone https://github.com/dreadlocked/DircoverRB.git
$ cd DircoverRB
$ bundle install
```

#### Usage
```
Usage: dircover.rb [options]
    -d, --domain DOMAIN              Hostname or IP address
    -p, --pages PAGES                Bing pages to be parsed, by default 30
    -h, --help                       Prints this help
```

#### Output example
![output example](https://github.com/dreadlocked/DircoverRB/raw/master/output_example.png)