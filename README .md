
# Menu Book Uploader
 project in rails where user can upload excel or csv of menu file and can view the uploaded menu on a new page 

 csv data looks like:

| dish_name       | dish_description                       | dish_type | allergens        | category    | price |
| --------------- | -------------------------------------- | --------- | ---------------- | ----------- | ---------- |
| Biriyani        | Flavoured Chicken and Rice savoury     | Non-Veg   |                 | Main Course | 280      |
| Porotta         | Indian Bread                           | Veg       | contains gluten | Bread       | 40      |
| paneer          | Indian                                 | Veg       | none             | Dish        | 200     |
| dal makhani     | Indian                                 | Veg       | none             | Dish        | 100      |
| dal tadka       | Indian                                 | Veg       | contains gluten | Dish        | 200      |
| fried rice      | Indian                                 | Veg       | contains gluten | Dish        | 300     |
| manchurian      | Indian                                 | Veg       | contains gluten | Dish        | 400      |

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
## Sample Files to Upload

- [Click here to download the sample menu in CSV format](https://docs.google.com/spreadsheets/d/1KAc6goOMJf5dgJzW91R6b8U-0RtBPxoEBLFPUcwCuUA/export?format=csv)
- [Click here to download the sample menu in XLSX format](https://docs.google.com/spreadsheets/d/1KAc6goOMJf5dgJzW91R6b8U-0RtBPxoEBLFPUcwCuUA/edit?usp=sharing)

 # Sidekiq and redis setup

 
- install redis (if not already installed)
for mac 
- install homebrew if not there
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
- install redis through Homebrew
``` 
brew install redis
```
-  ### start redis server
``` 
redis-server
```

- for windows
```
https://github.com/microsoftarchive/redis/releases
```

- ###  start sidekiq

``` 
bundle exec sidekiq
```

- to see background jobs
```bash
http://127.0.0.1:3000/sidekiq
```

#### This project can be modified further and authentication token system can be introduced by using popular gems like devise and jwt.

 






