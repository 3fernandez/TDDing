require 'rails_helper'

RSpec.describe FeedSource, type: :model do
	context "#fecth", :vcr do
		let(:feed_source) {
			feed_source = FeedSource.create!(
				name: 'Code-Squad News',
				url: 'http://feeds.feedburner.com/CodeSquadNews?format=xml'
			)
		}

		it "returns a valid array of feed entries" do
			VCR.use_cassette "link/create" do
				entries = feed_source.fetch

				expect(entries.first).to include(:link)
				expect(entries.first).to include(:title)
			end
		end
	end
end
