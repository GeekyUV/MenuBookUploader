
# Menu Book Uploader
 project in rails where user can upload excel or csv of menu file and can view the uploaded menu on a new page 

#### project uses Ruby version 3.2.2 and Rails version 7.0.7


## Features
- user can upload menu in csv or xlsx format
- have sidekiq integration to process large data
- delete,add and upload menus


## Getting Started
- Clone the repository:
```bash
 git clone https://github.com/GeekyUV/MenuBookUploader.git
 ```

 - initial setup
to initialize sidekiq and install all other required gems

 ```bash
bundle install 
 ```

 - Set up the database:
  ```bash
rails db:create
rails db:migrate
 ```


- Start the Rails server:
```bash
rails server or rails s

 ```
- Sample file to upload(download in .xlsx or .csv format)
```bash
https://docs.google.com/spreadsheets/d/1KAc6goOMJf5dgJzW91R6b8U-0RtBPxoEBLFPUcwCuUA/edit?usp=sharing
```


 # Sidekiq and redis setup

 
- install redis if not there
for mac
``` 
sudo apt-get install redis-server

brew install redis

redis-server
```

for windows
```
https://github.com/microsoftarchive/redis/releases
```

- start sidekiq

``` 
bundle exec sidekiq
```

- to see background jobs
```bash
http://127.0.0.1:3000/sidekiq
```

#### This project can be modified further and authentication token system can be introduced by using popular gems like devise and jwt.

 






