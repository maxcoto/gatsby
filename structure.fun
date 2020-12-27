


belongs_to "level"

string "last_name", required, default
string "email"
string "phone"
string "contact_method"
string "lead_source"
string "status"
text "objectives"
text "notes"
boolean "active"


rails new chatter_api --api --database=postgresql
cd chatter_api
rake db:setup
rails g scaffold [+up_singular+] first_name:string last_name:string email:string phone:string contact_method:string lead_source:string status:string objectives:text notes:text level:references active:boolean
rake db:migrate

uncomment in Gemfile
gem 'rack-cors'
bundle install

change content of
config/initializers/cors.rb
to:
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

add constants and admins to seed.rb
bx rake db:seed


/get includes relations in json
example:
@[+plural+] = [+up_singular+].all.includes(:level)
render json: @[+plural+].to_json(include: [:level])




















