source 'https://rubygems.org'

# Ruby Version
# ruby "2.2.1"

# Adding Sinatra Drivers
gem 'sinatra'
gem 'sinatra-contrib'

# Adding thin gem as advised
gem 'thin'

# Adding ActiveRecord and Database Components
gem 'activerecord'
gem 'activesupport'
gem 'sinatra-activerecord'

# Adding Database elements
gem 'pg'

# Adding rake for management
gem 'rake'

# Adding rspec for running unit testing
gem 'rspec'

group :development, :test do
	# Adding shotgun for local web hosting
	gem 'shotgun'
end

#Adding bcrypt to encrypt user's password
gem 'bcrypt'

#Adding byebug to do byebug
gem 'byebug'

#Adding Sinatra-Flash to flash error message
gem 'sinatra-flash'

group :production do
	# Heroku
	# ==================
	gem 'rails_12factor' # Heroku Gem Supports
	gem 'puma' # Using puma for
end