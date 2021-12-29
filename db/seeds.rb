puts "🌱 Seeding spices..."

# Seed your database here
bucketlist1 = Bucketlist.create(
  name: 'World Wonders',
  description: 'A list of wonders to see across the globe.',
  created_by: 'Wilfred Bayudan',
  pin: '1234',
  likes: 134
)

bucketlist1.destinations << Destination.create(
  label: 'Taj Mahal, Agra, UP, India',
  lat: 27.175031,
  lng: 78.04207,
  likes: 12
)

bucketlist1.destinations << Destination.create(
  label: 'Chichen Itza, YUC, Mexico',
  lat: 20.66667,
  lng: -88.56667,
  likes: 34
)

bucketlist1.destinations << Destination.create(
  label: 'Machu Picchu, CS, Peru',
  lat: -13.162669,
  lng: -72.544725,
  likes: 87
)

bucketlist1.destinations << Destination.create(
  label: 'Christ the Redeemer, Rio de Janeiro, Brazil',
  lat: -22.95166,
  lng: -43.21083,
  likes: 56
)

bucketlist1.destinations << Destination.create(
  label: 'Petra, MN, Jordan',
  lat: 30.32221,
  lng: 35.47933,
  likes: 122
)

bucketlist1.destinations << Destination.create(
  label: 'China',
  lat: 32.529718,
  lng: 106.802874,
  likes: 68
)

bucketlist1.destinations << Destination.create(
  label: 'Colosseum, Rome, RM, Italy',
  lat: 41.89018,
  lng: 12.49231,
  likes: 223
)

bucketlist1.comments << Comment.create(
  created_by: 'Wilfred Bayudan',
  comment: 'Your first comment!'
)


puts "✅ Done seeding!"
 