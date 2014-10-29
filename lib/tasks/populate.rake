namespace :db do
	desc "Import books with random title, number of pages, cover image, publish date"
	task :populate => :environment do
		require 'populator'
		require 'faker'
			Book.populate 100 do |b|
				b.title = Faker::Commerce.product_name
				b.number_of_pages = Faker::Number.number(3)
				b.coverimage = Faker::Avatar.image("my-own-slug", "50x50")
				b.publish_date = Faker::Business.credit_card_expiry_date
			end
			puts 'All done'
	end
end