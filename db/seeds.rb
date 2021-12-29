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

bucketlist2 = Bucketlist.create(
  name: 'Popular Cities',
  description: 'For the lover of busy streets and high rises.',
  created_by: 'John Doe',
  pin: '1234',
  likes: 122
)

bucketlist2.destinations << Destination.create(
  label: 'New York, NY, USA',
  lat: 40.68295,
  lng: -73.9708,
  likes: 333
)

bucketlist2.destinations << Destination.find_by(label: 'China')

bucketlist2.destinations << Destination.create(
  label: 'Paris, France',
  lat: 48.858705,
  lng: 2.342865,
  likes: 333
)

bucketlist2.destinations << Destination.create(
  label: 'Madrid, Spain',
  lat: 40.429913,
  lng: -3.669245,
  likes: 121
)

bucketlist2.destinations << Destination.create(
  label: 'Honolulu, HI, USA',
  lat: 21.308822,
  lng: -157.859944,
  likes: 121
)

bucketlist2.destinations << Destination.create(
  label: 'London, England, United Kingdom',
  lat: 51.509648,
  lng: -0.099076,
  likes: 99
)

bucketlist2.destinations << Destination.create(
  label: 'Tokyo, Japan',
  lat: 35.695126,
  lng: 139.75391,
  likes: 653
)

bucketlist2.comments << Comment.create(
  created_by: 'John Doe',
  comment: "I'd love to visit these places some day!"
)

bucketlist3 = Bucketlist.create(
  name: 'Eurolovers',
  description: 'Europe is filled with historical sites to see.',
  created_by: 'Jane Smith',
  pin: '1234',
  likes: 67
)

bucketlist3.destinations << Destination.find_by(label: 'Madrid, Spain')
bucketlist3.destinations << Destination.find_by(label: 'London, England, United Kingdom')

puts "✅ Done seeding!"
 