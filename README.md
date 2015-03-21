# paulrobertlloyd.com

Source files to build my personal website, currently in development.

## System requirements

* Ruby 2.0.0 or higher
* ExifTool (`brew install ExifTool`)
* nginx (`brew install nginx`)

## Installation

1. Ensure you have a working Ruby 2.0.0 (or higher) environment.
2. Install [Bundler][1]: `gem install bundler`. This is used to manage Ruby gems and their dependencies.
3. Clone this repository: `git clone git@github.com:/paulrobertlloyd/paulrobertlloyd.com`.
4. Run `bundle install` inside the cloned repository. This command installs the gems described in `Gemfile`, namely [Jekyll][2] and [Rake][3].
5. Run `bundle exec rake build` inside the cloned repository. This will prepare the website assets and generate the static files that constitute the website.

The generated site will be contained in the `public` directory.

## Deploying

1. Ensure the destination server meets the system requirements.
2. Run `bundle exec rake deploy`.

[1]: http://bundler.io
[2]: https://jekyllrb.com
[3]: http://rake.rubyforge.org
