require 'nokogiri'
require 'net/http'
require_relative 'tree.rb'

class BingParser

	attr_accessor :tree, :bing_uri

	def initialize(domain,pages=30)
		@tree = UrlPathTree.new
		@bing_uri = URI('http://www.bing.com/search')
		@domain = domain
		@max_queries = pages.to_i
		@results_per_query = 10 # => Max results per query allowed by Bing
	end

	#
	# Query Bing with site:<hostname> dork, parses every result and
	# stores results on tree structure.
	#
	def discover
		queries = 0
		while queries <= @max_queries
			
			if queries != 0 
				first_bing_parameter = @results_per_query+1
			else
				first_bing_parameter = 0
			end
			
			body = Nokogiri::HTML::parse get(first_bing_parameter)
			items = body.css('ol#b_results')
			items.each do |item|
				item.css('li>h2>a').each do |link|
					@tree.add(link.attr('href').to_s)
				end
			end
			show_info(queries)
			queries += 1
			@results_per_query+=10
		end
	end

	def show_info(queries)
		print "[+] Requesting Bing: " + queries.to_s + "/" + @max_queries.to_s + "\r"
	end

	#
	# Query bing using "site:" dork
	#
	def get(first)
 		params = {:q => "site:" + @domain, :first => first, :FORM => "PERE" }
		@bing_uri.query = URI.encode_www_form(params)
		response = Net::HTTP.get_response(@bing_uri)
		return response.body
	end

end