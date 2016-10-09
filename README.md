# paulrobertlloyd.com

Source files to build my personal website.

## System requirements
* Ruby 2.0.0 or higher
* nginx (`brew install nginx`)
* [ngx_http_image_filter_module][1]

## Installation
1. Ensure you have a working Ruby 2.0.0 (or higher) environment.
2. Install [Bundler][2]: `gem install bundler`. This is used to manage Ruby gems and their dependencies.
3. Clone this repository: `git clone --recursive git@github.com:/paulrobertlloyd/paulrobertlloyd.com`.
4. Run `bundle install` inside the cloned repository. This command installs the gems described in `Gemfile`, namely [Jekyll][3] and [Rake][4].
5. Ensure all required environment variables have been set, i.e. `MEDIUM_USER_ID` and `MEDIUM_INTEGRATION_TOKEN`.
6. Run `bundle exec rake build` inside the cloned repository. This will prepare the website assets and generate the static files that constitute the website.

The generated site will be contained in the `www` directory.

## Updating submodules
This project makes use of third-party libraries, included as git submodules. To update these, run `git submodule foreach git pull origin master`.

## Running locally with HTTPS
To run with HTTPS locally on macOS, you should follow the setup [as described here][5]. To create the required SSL certificates, follow these steps:

1. Open Terminal.app
2. Change into the correct directory: `cd Sites/paulrobertlloyd/etc/ssl`
3. Configure SSL:
```
cat > openssl.cnf <<-EOF
  [req]
  distinguished_name = req_distinguished_name
  x509_extensions = v3_req
  prompt = no
  [req_distinguished_name]
  CN = *.paulrobertlloyd.dev
  [v3_req]
  keyUsage = keyEncipherment, dataEncipherment
  extendedKeyUsage = serverAuth
  subjectAltName = @alt_names
  [alt_names]
  DNS.1 = *.paulrobertlloyd.dev
  DNS.2 = paulrobertlloyd.dev
EOF
```
4. Create the certificate files:
```
openssl req \
  -new \
  -newkey rsa:2048 \
  -sha1 \
  -days 3650 \
  -nodes \
  -x509 \
  -keyout ssl.key \
  -out ssl.crt \
  -config openssl.cnf
```
5. Delete the configuration file: `rm openssl.cnf`

## Deploying
1. Ensure the destination server meets the system requirements.
2. Run `bundle exec rake deploy`.

[1]: http://nginx.org/en/docs/http/ngx_http_image_filter_module.html
[2]: http://bundler.io
[3]: http://jekyllrb.com
[4]: http://rake.rubyforge.org
[5]: https://gist.github.com/jed/6147872
