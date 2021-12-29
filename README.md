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
#### Bucketlists
* **GET** `/bucketlists`

Retrieves an array of all bucketlists in the database.

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
    "bucketlist_destinations": [...],
    "tags": [...]
  },
  {
    "id": 2,
    "name": "Popular Cities",
    "description": "For the lover of busy streets and high rises.",
    "created_by": "John Doe",
    "likes": 122,
    "created_at": "2021-12-29T08:16:50.721Z",
    "updated_at": "2021-12-29T08:16:50.721Z",
        "bucketlist_destinations": [...],
    "tags": [...]
  },
  ...
]
```

* **GET** `/bucketlists/findby/:attr/:query`

Searches for bucketlists using a specified attribute (:attr) and returns an array of results. If no results are found, an empty array is returned.

For example, making a `GET` request to `/bucketlists/findby/name/world%20wonders` will result in a response such as:

```
[
  {
    "id": 1,
    "name": "World Wonders",
    "description": "A list of wonders to see across the globe.",
    "created_by": "Wilfred Bayudan",
    "likes": 134,
    "created_at": "2021-12-29T08:16:50.700Z",
    "updated_at": "2021-12-29T08:16:50.700Z"
  }
]
```

* **GET** `/bucketlists/:id`

Finds and retrieves information for the specified bucketlist using it's `id`.

Example response:

```
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
  "tags": [],
  "comments": []
}
```

* **GET** `/bucketlists/:id/auth`

When making a GET request to this endpoint, the headers of the request must contain a `PIN`. The `PIN` included in the headers will be compared with the PIN stored in the database and return a boolean. 

Sample request using JavaScript `fetch()`:
```
fetch(`http://localhost:9292/bucketlists/1/auth`, {
        headers: {
          'PIN': 1234
        }
      })
```
Will return `{ "permission": false }` if the PIN saved in the database is NOT 1234, or `{ "permission": true }` if it is.

* **POST** `/bucketlists`

Post requests to this endpoint will create and save a bucketlist. The body of the request must contain a `name`, `description`, `created_by`, and a `pin`.

In response, the newly created bucketlist is returned as an object.

Example response:
```
{
    "id": 6,
    "name": "Mr. Postman",
    "description": "A song is not a bucketlist!",
    "created_by": "Lil Wayne",
    "likes": 0,
    "created_at": "2021-12-29T09:09:32.764Z",
    "updated_at": "2021-12-29T09:09:32.764Z",
    "pin": "1234",
    "bucketlist_destinations": [],
    "tags": []
}
```

* **POST** `/bucketlists/:id/comments`

Requires a `created_by` and `comment` in the body of the request. Returns the comment added to the bucketlist as an object.

Example response:
```
{
    "id": 3,
    "created_by": "John Doe",
    "comment": "This is my comment from John!",
    "rating": 0,
    "bucketlist_id": 1,
    "destination_id": null,
    "created_at": "2021-12-29T09:12:17.264Z",
    "updated_at": "2021-12-29T09:12:17.272Z"
}
```

## Contributing

Contributing Bug reports and pull requests are welcome on GitHub at https://github.com/wilfredbayudan/wanderlist-server. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

## License

This project is available as open source under the terms of the MIT License.

## Code of Conduct

Everyone interacting in the wanderlist-server project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.