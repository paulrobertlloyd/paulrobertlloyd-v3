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

## Deploying
1. Ensure the destination server meets the system requirements.
2. Run `bundle exec rake deploy`.

[1]: http://nginx.org/en/docs/http/ngx_http_image_filter_module.html
[2]: http://bundler.io
[3]: http://jekyllrb.com
[4]: http://rake.rubyforge.org
