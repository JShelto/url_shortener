# URL Shortener

## Description
A URL shortener - 

The app takes the provided url paramater and uses it to create a URL object which is stored in the database. The shortened URL is created by converting the id of the Url object to Base62 encoding. Once the shortened, friendly url is created, Nokogiri is used to crawl the original url and acquire the title of the page.



## API
##### Get shortened URL
`curl -X POST -d "url=https://google.com" localhost:3000/url.json`

##### Return list of top 100 urls
`curl localhost:3000/top.json`

##### Show the URL that the app is redirecting you to
`curl -I http://localhost:3000/abc`

### Setup:

Steps to get app running locally:  

#### Clone the repo
`cd ~/url_shortener/`  
`git clone https://github.com/JShelto/url_shortener.git`  

#### Checkout the branch with the most recent commits:  
`git checkout master && git pull origin master`

#### Install homebrew if using MacOS
<https://brew.sh/>

#### Install Ruby Version Manager (RVM), Ruby, and Rails: http://rvm.io/rvm/install
`brew install rvm`

#### Then switch to Ruby 2.4.2 and install Rails  
`rvm install "ruby-2.5.1"`  
`gem install rails`

#### Install Postgres.app (10.5)
`brew install postgres`

#### Install dependencies  
`bundle install`

#### Start the server
`rails s`  


