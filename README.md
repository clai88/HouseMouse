<p align="center">
<a href="#"><img src="http://i.imgur.com/X5uYv60.png" alt="housmouse logo" height="114" width="500" ></a>
<p />


<p align="center">
Amazingly simple webapp that allows you to view important home information.
<p />


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
<br>
    - To modify the routes, open `config/routes.rb`
    <br>
    The format for generating paths and URL's is:
      ```rb
      get '/house/:id' => 'house#show', as: 'house'
      ```
      Alternatively, simply entering the line below will generate all CRUD routes for the matching controller
      ```rb
      resources :house
      ```

    - In order to generate a new migration, type:
    `
    $ bin/rails g migration NAME [field[:type][:index] field[:type][:index]]
    `

    - To edit the models, views, and controllers, visit the `app/` directory <br />

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
    By default, the rails app will start on port 3000, but you can change this with the modifier
    ```
    bin/rails s -p #anyport
    ```

    To be safe, please make sure the port is between 1024 and 65535

4. To see your edits come to life, open your browser and enter
    ```http
    localhost:3000 (or whichever port you chose)
    ```
5. Celebrate! You're on Rails!

## TDO
- [x] Search houses
- [x] View previously searched houses
- [x] Star, edit,and delete previously searched houses
- [ ] View mortgage information for <del>most</del> all houses

## Screenshots
![HouseMouse homepage](http://i.imgur.com/CwrdiAx.png)

![HouseMouse previously searched page](http://i.imgur.com/wVDZOOW.png)


##Feature request
HouseMouse currently only utilizes [zillow](http://www.zillow.com/howto/api/APIOverview.htm) and [walkscore's](https://www.walkscore.com/professional/api.php) api, but if you like to see more API's implemented, please contact me at clai88@gmail.com
