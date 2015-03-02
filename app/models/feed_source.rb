require 'open-uri'

class FeedSource < ActiveRecord::Base
	def fetch
		rss = SimpleRSS.parse(open(self.url))
		rss.entries
	end
end
