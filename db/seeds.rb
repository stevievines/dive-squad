# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach(File.open('dives.csv'), headers: true) do |row|
  dive = row.to_hash
  Dive.find_or_create_by(
    number: dive['dive'],
    height: dive['height'].to_i,
    description: dive['description']
  )
end
