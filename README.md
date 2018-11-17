# v3.paulrobertlloyd.com

*My personal website. There are many like it, but this was mine (2015-2018).*

## Requirements

* [nginx](https://nginx.org)
* [Ruby](https://www.ruby-lang.org) (2.4.0 or higher)
* [Jekyll](https://jekyllrb.com)

## Installation

1. `git clone git@github.com:paulrobertlloyd/paulrobertlloyd.com.git`
2. `cd paulrobertlloyd.com`
3. `git submodule update --init --recursive`
4. `gem install bundler && bundle install`
5. `bin/build`

Generated files will be saved in the `www` directory.

## Development

When developing the site, you may want files automatically compiled and the browser to refresh automatically. To do this, run `bin/dev`.

### Updating submodules

This project makes use of third-party libraries, included as git submodules. To update these, run `git submodule foreach git pull origin master`.

### Running locally with HTTPS

To run with HTTPS locally on macOS first [follow the setup steps described here](https://gist.github.com/jed/6147872). To create the required SSL certificates, follow these steps:

1. Change into the correct directory: `cd etc/nginx`
2. Create the certificate files:

  ```
  openssl req \
    -new \
    -newkey rsa:2048 \
    -sha256 \
    -days 3650 \
    -nodes \
    -x509 \
    -keyout test.key \
    -out test.crt \
    -subj /CN=v3.paulrobertlloyd.test \
    -reqexts SAN \
    -extensions SAN \
    -config <(cat /System/Library/OpenSSL/openssl.cnf \
      <(printf '[SAN]\nsubjectAltName=DNS:v3.paulrobertlloyd.test'))
  ```

## Deployment

This site is deployed automatically by Travis whenever files are pushed to `master`. However, if you wish to manually deploy from local, follow these steps:

1. Ensure the destination server meets the system requirements
2. Ensure the `PAULROBERTLLOYD_DEPLOY_DEST` environment variable has been set
2. Run `bin/deploy`

## Repo structure

```
v3.paulrobertlloyd.com
├── bin                # Scripts
│   ├── build          # Generate files and save them to destination
│   ├── cibuild        # Generate files and save them to destination (CI)
│   ├── deploy         # Sync generated with remote server
│   └── dev            # Generate files and reload browser when updated
│
├── etc                # CONFIGURATION
│   ├── jekyll         # Jekyll site generation
│   ├── nginx          # Nginx server
│   └── travis         # Travis
│
├── src                # SOURCE
│
├── (www)              # COMPILED (ignored by git)
│
├── .editorconfig      # Text editor preferences
├── .gitignore         # List of files not tracked by git
├── .gitmodules        # List of submodules tracked by git
├── .travis.yml        # Configuration file for Travis
├── Gemfile            # Ruby Gems package manifest
├── Gemfile.lock       # Ruby Gems lock file
├── package.json       # Node.js package manifest
├── package-lock.json  # Node.js package lock file
└── README.md          # This file
```

© [Paul Robert Lloyd](https://paulrobertlloyd.com)
