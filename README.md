# Jstz::Rails

This is [jstz.js aka jsTimezoneDetect](https://bitbucket.org/pellepim/jstimezonedetect/) GEMified for the Rails >= 3.1 asset pipeline through the following:

	bundle gem jstz-rails
	cd jstz-rails
	mkdir -p vendor/assets/javascripts
	curl https://bitbucket.org/pellepim/jstimezonedetect/raw/c7ea46531444b600246fe651bc9feb66a7593be5/jstz.js -o vendor/assets/javascripts/jstz.js
	echo "" >> README.md; echo "# jstz.js appended README #" >> README.md; echo "" >> README.md
	curl https://bitbucket.org/pellepim/jstimezonedetect/raw/c7ea46531444b600246fe651bc9feb66a7593be5/README.md >> README.md
	echo "" >> LICENSE; echo "# jstz.js appended LICENSE #" >> LICENSE; echo "" >> LICENSE
	curl https://bitbucket.org/pellepim/jstimezonedetect/raw/c7ea46531444b600246fe651bc9feb66a7593be5/LICENCE.txt >> LICENSE
	git add .
	git commit -am "initial jstz-rails"
	git remote add origin git@github.com:vanetten/jstz-rails.git

* modify **lib/jstz-rails/version.rb** to match jstz.js version

		VERSION = "1.0.4.1"

* modify **lib/jstz-rails.rb** to subclass Rails::Engine

		class Engine < ::Rails::Engine
		end

* modify **jstz-rails.gemspec**

		gem.description   = "This gem provides jstz.js and for your Rails 3 application."
		gem.summary       = "Use jstz with Rails 3"
		gem.homepage      = "http://rubygems.org/gems/jstz-rails"
		gem.files = Dir["{lib,vendor}/**/*"] + ["LICENSE", "README.md"]
		gem.add_dependency "railties", "~> 3.1"

* build

		rake build

* release

		rake release

## Installation

Add this line to your application's Gemfile:

    gem 'jstz-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jstz-rails

## Usage

Add to **application.js**

	//= require jstz.js

Add to **your.js** to write browser detected timezone to a cookie

	document.cookie = 'time_zone='+jstz.determine().timezone.name()+';';

Add to **application_controller.rb** to set application's timezone from cookie

	before_filter :set_timezone
	private
		def set_timezone
			Time.zone = cookies["time_zone"]
		end

Or add to view to set default from cookie (e.g. simple_form)

	<%= f.input :time_zone, priority: /US/, :default => cookies["time_zone"] %>
	
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# jstz.js appended README #

## Introduction

This script gives you the zone info key representing your device's time zone setting. 

The return value is an [IANA zone info key][1] (aka the Olson time zone database).

The IANA timezone database is pretty much standard for most platforms (UNIX and Mac support it natively, and every programming language in the world either has native support or well maintained libraries that support it).

## Example Use

There is a [minified version in the repo][3] called `jstz.min.js`. Include it in your HTML document.

Invoke the script by calling

    :::javascript
        var tz = jstz.determine(); // Determines the time zone of the browser client
        tz.name(); // Returns the name of the time zone eg "Europe/Berlin"

## Use Case

The script is useful if you do not want to disturb your users with questions about what time zone they are in. You can rely on this script to give you a key that is usable for server side datetime normalisations across time zones. 

## Limitations

This script does not do geo-location, nor does it care very much about historical time zones. 

So if you are unhappy with the time zone "Europe/Berlin" when the user is in fact in "Europe/Stockholm" - this script is not for you. (They are both identical in modern time).

Also, if it is important to you to know that in Europe/Simferopool (Ukraine) the UTC offset before 1924 was +2.67, sorry, this script will not help you.

Time zones are a screwed up thing, generally speaking, and the scope of this script is to solve problems concerning modern time zones, in this case from 2010 and forward.

## Demo

There is an updated demo running on: [http://pellepim.bitbucket.org/jstz/][2].

## Contribute?

If you want to contribute to the project (perhaps fix a bug, or reflect a change in time zone rules), please simply issue a Pull Request. Don't worry about [Grunt][4] builds etc, all you need to modify is the jstz.js file and I'll take care of the testing/minifying etc.

## Credits

Thanks to
  
  - [Josh Fraser][5] for the original idea
  - [Brian Donovan][6] for making jstz CommonJS compliant
  - [Ilya Sedlovsky][7] for help with namespacing

Other contributors:
[Gilmore Davidson][8]

[1]: http://www.iana.org/time-zones
[2]: http://pellepim.bitbucket.org/jstz/
[3]: https://bitbucket.org/pellepim/jstimezonedetect/src
[4]: https://github.com/gruntjs/grunt
[5]: http://www.onlineaspect.com/about/
[6]: https://bitbucket.org/eventualbuddha
[7]: https://bitbucket.org/purebill
[8]: https://bitbucket.org/gdavidson
