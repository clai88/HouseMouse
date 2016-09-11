Amazingly simple webapp that allows you to view important home information.

![HouseMouse homepage](http://i.imgur.com/HMQcYyg.png)

## Getting started

To get started, simply visit [**housemouse**](https://housemouse.herokuapp.com/) and start searching houses right away.

## Going through localhost

If you wanted to modify the code and go through localhost, follow the instructions below

1. Type the following into command prompt:
```
$ git clone git@github.com:clai88/HouseMouse.git
```
2. Run the command:
```
$ bundle install
```
Simply running `bundle` will also work

3. Edit any part of the project you desire.
<br />
- To modify the routes, open `routes.rb` (located in `config/routes`).
<br />
The format for generating paths and URL's is:
```rb
get '/house/:id' => 'house#show', as: 'house'
```
Alternatively, simply entering the line below will generate all CRUD routes.
```rb
resources :house
```
- In order to generate a new controller, type:
```
$ bin/rails generate controller NAME [action action]
```
- To generate a new model, type:
```
$ bin/rails g model NAME [field[:type][:index] field[:type][:index]]
```
- To generate a new migration, type:
```
$ bin/rails g migration NAME [field[:type][:index] field[:type][:index]]
```
- To edit existing controllers, visit
```
app/controllers
```
- To edit existing models, visit
```
app/models
```
>After editing the databases (generating new model or migrations), run the command `$ rake db:migrate`, which will run single migrations that have not been run yet.  
<bbr />
A list of your current tables and their columns can be found at `db/schema.rb`.
<br />
<br />
If you edit the Gemfile, be sure to `bundle` afterwards


3. To start your rails app, run:
```
bin/rails server
```
<br />

By default, the rails app will start on port 3000, but you can modify this with the modifier
```
bin/rails s -p #anyport
```
<br />

To be safe, please make sure the port is between 1024 and 65535

4. To see your edits come to life, open your browser and enter
```http
localhost:3000 (or whichever port you chose)
```
5. Celebrate! You're on Rails!

##Feature request
HouseMouse currently only utilizes [zillow](http://www.zillow.com/howto/api/APIOverview.htm) and [walkscore's](https://www.walkscore.com/professional/api.php) api, but if you like to see more API's implemented, please contact me at clai88@gmail.com
