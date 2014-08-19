# paulrobertlloyd.com

Source files to build my personal website, currently in development -- as is this document.

## System requirements
(TODO: confirm version requirements in this section)

* Ruby 1.9.2 or higher
* Node.js

## Installation

1. Ensure you have a working Ruby 2.0.0 (or higher) environment.
2. Install [Bundler][1]: `gem install bundler`. This is used to manage Ruby gems and their dependencies.
3. Clone this repository: `git clone git@github.com:/paulrobertlloyd/paulrobertlloyd.com`.
4. Run `bundle install` inside the cloned repository. This command installs the gems described in `Gemfile`, namely [Jekyll][2], [Rake][3] and [Capistrano][4].
5. Run `bundle exec rake install` inside the cloned repository. This command runs a Rake task that will install the [node.js][5] modules described in `package.json`, namely [Myth][6] and [Uglify.js][7].
6. Run `bundle exec rake build` inside the cloned repository. This will prepare the website assets and generate the static files that constitute the website.

The generated site will be contained in the `public` directory.

## Deploying

1. Ensure the destination server meets the system requirements.
2. Run `cap production deploy`.

## A note about comments

This website supports [static comments][8], that is comments that are included as HTML during build. As comments contain sensitive data (namely commenters' email addresses), they are not available publically. Use `remarks_dir` in Jekyll’s config file to point to the location of comments on the local server.

[1]: http://bundler.io "Bundler website"
[2]: https://jekyllrb.com "Jekyll repository"
[3]: http://rake.rubyforge.org "RAKE - Ruby Make"
[4]: http://capistranorb.com "Remote server automation and deployment"
[5]: http://nodejs.org "node.js website"
[6]: http://myth.io "Myth CSS preprocessor"
[7]: https://github.com/mishoo/UglifyJS "Uglify JS parser/compressor/beautifier"
[8]: https://github.com/mpalmer/jekyll-static-comments "Static comments"