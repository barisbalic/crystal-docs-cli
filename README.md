# crystal-docs-cli

A simple CLI tool for publishing [Crystal](https://crystal-lang.org) Shard documentation to
[crystal-docs.org](https://crystal-docs.org).
It is a *requirement* that users have first identified themselves on the website before they are able to publish.

The tool is just a convenient wrapper for [rsync](https://en.wikipedia.org/wiki/Rsync), so you must also have that
installed.

## Installation

Requires [crystal-lang](https://crystal-lang.org) 0.18.7+

```
git clone git@github.com:barisbalic/crystal-docs-cli.git
cd crystal-docs-cli
shards install
crystal build --release src/crystal-docs.cr
```

## Usage

The first step is to publish the current documentation for your Shard.
```sh
crystal-docs publish
```

Once you have done this, you may publish docs for a specific version...
```sh
crystal-docs publish 0.1.0
```

Or... for a branch/tag.
```sh
crystal-docs publish rc1
```

Optionally you may generate documentation before pushing...
```sh
crystal-docs publish -g
```

Should you need to publish docs as another user, you may specify a user with the `-u` flag.
```sh
crystal-docs publish -u lemondrizzle
```

## Contributing

1. Fork it ( https://github.com/barisbalic/crystal-docs/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [barisbalic](https://github.com/barisbalic) Baris Balic - creator, maintainer
