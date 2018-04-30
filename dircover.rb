require_relative 'lib/bing.rb'
require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: dircover.rb [options]"

  opts.on("-d DOMAIN", "--domain DOMAIN", "Hostname or IP address") do |d|
    options[:domain] = d
  end

  opts.on("-p PAGES", "--pages PAGES", "Bing pages to be parsed, by default 30") do |p|
    options[:pages] = p
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end

end.parse!

bing = BingParser.new(options[:domain], options[:pages] || 15)
bing.discover
bing.tree.print(bing.tree.root)