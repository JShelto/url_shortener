# URL Shortener

### Overview:

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
