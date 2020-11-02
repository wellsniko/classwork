# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{username: "Cameron"},{username:"Niko"},{username: "Klay"},{username: "Steph"},{username: "Iggy"},{username: "Pam Anderson"}])
Artwork.create(title: "Cam's Art", image_url: "AVBSADG", artist_id: users.first.id)
Artwork.create(title: "Niko's Art", image_url: "696969", artist_id: 2)
Artwork.create(title: "Pam's Art", image_url: "BIGB88BS", artist_id: 6)
Artwork.create(title: "Klay's Art", image_url: "SP0TSH00T", artist_id: 3)
Artwork.create(title: "Steph's Art", image_url: "0FFDR1B", artist_id: 4)
Artwork.create(title: "Iggy's Art", image_url: "D3F3N3E", artist_id: 5)

ArtworkShare.create(artwork_id: 3, viewer_id: 1)
ArtworkShare.create(artwork_id: 3, viewer_id: 2)
ArtworkShare.create(artwork_id: 3, viewer_id: 3)
ArtworkShare.create(artwork_id: 3, viewer_id: 4)
ArtworkShare.create(artwork_id: 3, viewer_id: 5)
ArtworkShare.create(artwork_id: 2, viewer_id: 6)
