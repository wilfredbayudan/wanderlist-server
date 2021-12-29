# Wanderlist (Backend)

Wanderlist is a web-based app that allows users to share lists of travel destinations. Users may view bucketlists, interact with them through likes and comments, or create and share their own.

Live Frontend Demo at https://wanderlist.jaybayudan.com

Live Backend Demo at https://wanderlist-server.herokuapp.com

![Wanderlist Demo](preview.gif)

See [wanderlist-client](https://github.com/wilfredbayudan/wanderlist-client) for the frontend repository.

## Features
- [x] **C**reate / **R**ead / **U**pdate / **D**elete bucketlists
- [x] Add destinations to a bucketlists
- [x] Like/Dislike bucketlists
- [x] Like/Dislike destinations
- [x] Comment on a bucketlist
- [ ] Comment on a destination
- [ ] Rate a bucketlist
- [ ] Rate a destination
- [x] Interactive map integration with markers and popups

## Installation
### Prerequisites
Before you continue, ensure you have met the following requirements:
* You have installed the latest version of [Ruby](https://www.ruby-lang.org/en/documentation/installation/).
---
1. [Fork and clone](https://github.com/wilfredbayudan/wanderlist-server/fork) this repository.
2. Run `bundle install` to install dependency gems.
3. Run `rake db:migrate` to run migrations and seed the database.
4. Start the server by running:
```console
$ bundle exec rake server
```

This will run your server on port
[http://localhost:9292](http://localhost:9292).

Have fun!

## Usage

### Endpoints
* `/bucketlists` - **GET**
Making a `GET` request to this endpoint will retrieve a list of all bucketlists in the database.

Example response:
```
[
  {
    "id": 1,
    "name": "World Wonders",
    "description": "A list of wonders to see across the globe.",
    "created_by": "Wilfred Bayudan",
    "likes": 134,
    "created_at": "2021-12-29T08:16:50.700Z",
    "updated_at": "2021-12-29T08:16:50.700Z",
    "bucketlist_destinations": [
      {
        "id": 1,
        "notes": null,
        "destination": {
          "id": 1,
          "label": "Taj Mahal, Agra, UP, India",
          "lng": 78.04207,
          "lat": 27.175031,
          "likes": 12
        }
      },
      {
        "id": 2,
        "notes": null,
        "destination": {
          "id": 2,
          "label": "Chichen Itza, YUC, Mexico",
          "lng": -88.56667,
          "lat": 20.66667,
          "likes": 34
        }
      },
      {
        "id": 3,
        "notes": null,
        "destination": {
          "id": 3,
          "label": "Machu Picchu, CS, Peru",
          "lng": -72.544725,
          "lat": -13.162669,
          "likes": 87
        }
      },
      {
        "id": 4,
        "notes": null,
        "destination": {
          "id": 4,
          "label": "Christ the Redeemer, Rio de Janeiro, Brazil",
          "lng": -43.21083,
          "lat": -22.95166,
          "likes": 56
        }
      },
      {
        "id": 5,
        "notes": null,
        "destination": {
          "id": 5,
          "label": "Petra, MN, Jordan",
          "lng": 35.47933,
          "lat": 30.32221,
          "likes": 122
        }
      },
      {
        "id": 6,
        "notes": null,
        "destination": {
          "id": 6,
          "label": "China",
          "lng": 106.802874,
          "lat": 32.529718,
          "likes": 68
        }
      },
      {
        "id": 7,
        "notes": null,
        "destination": {
          "id": 7,
          "label": "Colosseum, Rome, RM, Italy",
          "lng": 12.49231,
          "lat": 41.89018,
          "likes": 223
        }
      }
    ],
    "tags": []
  },
  {
    "id": 2,
    "name": "Popular Cities",
    "description": "For the lover of busy streets and high rises.",
    "created_by": "John Doe",
    "likes": 122,
    "created_at": "2021-12-29T08:16:50.721Z",
    "updated_at": "2021-12-29T08:16:50.721Z",
    "bucketlist_destinations": [
      {
        "id": 8,
        "notes": null,
        "destination": {
          "id": 8,
          "label": "New York, NY, USA",
          "lng": -73.9708,
          "lat": 40.68295,
          "likes": 333
        }
      },
      {
        "id": 9,
        "notes": null,
        "destination": {
          "id": 6,
          "label": "China",
          "lng": 106.802874,
          "lat": 32.529718,
          "likes": 68
        }
      },
      {
        "id": 10,
        "notes": null,
        "destination": {
          "id": 9,
          "label": "Paris, France",
          "lng": 2.342865,
          "lat": 48.858705,
          "likes": 333
        }
      },
      {
        "id": 11,
        "notes": null,
        "destination": {
          "id": 10,
          "label": "Madrid, Spain",
          "lng": -3.669245,
          "lat": 40.429913,
          "likes": 121
        }
      },
      {
        "id": 12,
        "notes": null,
        "destination": {
          "id": 11,
          "label": "Honolulu, HI, USA",
          "lng": -157.859944,
          "lat": 21.308822,
          "likes": 121
        }
      },
      {
        "id": 13,
        "notes": null,
        "destination": {
          "id": 12,
          "label": "London, England, United Kingdom",
          "lng": -0.099076,
          "lat": 51.509648,
          "likes": 99
        }
      },
      {
        "id": 14,
        "notes": null,
        "destination": {
          "id": 13,
          "label": "Tokyo, Japan",
          "lng": 139.75391,
          "lat": 35.695126,
          "likes": 653
        }
      }
    ],
    "tags": []
  },
  {
    "id": 3,
    "name": "Eurolovers",
    "description": "Europe is filled with historical sites to see.",
    "created_by": "Jane Smith",
    "likes": 67,
    "created_at": "2021-12-29T08:16:50.729Z",
    "updated_at": "2021-12-29T08:16:50.729Z",
    "bucketlist_destinations": [
      {
        "id": 15,
        "notes": null,
        "destination": {
          "id": 10,
          "label": "Madrid, Spain",
          "lng": -3.669245,
          "lat": 40.429913,
          "likes": 121
        }
      },
      {
        "id": 16,
        "notes": null,
        "destination": {
          "id": 12,
          "label": "London, England, United Kingdom",
          "lng": -0.099076,
          "lat": 51.509648,
          "likes": 99
        }
      }
    ],
    "tags": []
  }
]
```

## Contributing

Contributing Bug reports and pull requests are welcome on GitHub at https://github.com/wilfredbayudan/wanderlist-server. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

## License

This project is available as open source under the terms of the MIT License.

## Code of Conduct

Everyone interacting in the wanderlist-server project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.