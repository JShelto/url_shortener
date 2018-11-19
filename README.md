# URL Shortener

##Description
A URL shortener - 

The app takes the provided url paramater and uses it to create a URL object which is stored in the database. The shortened URL is created by converting the id of the object to Base62 encoding. Once the shortened, friendly url is created, Nokogiri is used to crawl the original url and acquire the title of the page.



##API
##### Get shortened URL
`curl -X POST -d "url=https://google.com" https://powerful-retreat-50185.herokuapp.com/url.json`

##### Return list of top 100 urls
`curl https://powerful-retreat-50185.herokuapp.com/top.json`

##### Show the URL that the app is redirecting you to
`curl -I http://localhost/abc`

### Setup:

Steps to get app running locally:  

1. #### Navigate to a good folder and clone the repo
`cd ~/url_shortener/`  
`git clone https://github.com/JShelto/url_shortener.git`  

2. #### Checkout the branch with the most recent commits:  
`git checkout master && git pull origin master`

3. #### Mac OS X users might wanna install homebrew _(so you can easily install RVM)_
<https://brew.sh/>

4. #### Install Ruby Version Manager (RVM), Ruby, and Rails: http://rvm.io/rvm/install
`brew install rvm`

5. #### Then switch to Ruby 2.4.2 and install Rails  
`rvm install "ruby-2.5.1"`  
`gem install rails`

6. #### Install Postgres.app (10.5)
`brew install postgres`

7. #### Install dependencies  
`bundle install`

8. #### Run it!  
`rails s`  


