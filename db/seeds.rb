# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


FeedBack.destroy_all
ActiveRecord::Base.connection.execute("TRUNCATE feed_backs")

file_name = 'Robinhood_GooglePlay_Reviews_enUS.csv'
f = File.open(file_name)
lines = f.read
i = 0
lines.each_line do |line|
  if i >= 1
    row = line.split(',')
    puts row
    begin
      FeedBack.create(feed_back_id: row[0], username: row[1], user_image: row[2],
         content: row[3], score: row[4], thumbs_up_count: row[5], review_created_version: row[6], at: row[7],
         reply_content: row[8], reply_at: row[9])
    rescue StandardError => e
    end
  end
  i += 1
  break if i > 10000
end
f.close
