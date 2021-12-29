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

## Contributing

Contributing Bug reports and pull requests are welcome on GitHub at https://github.com/wilfredbayudan/wanderlist-server. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the code of conduct.

## License

This project is available as open source under the terms of the MIT License.

## Code of Conduct

Everyone interacting in the wanderlist-server project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.