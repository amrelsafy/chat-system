# Chat System
- This chat system is built upon Ruby on Rails with a MySQL datastore. It allows users to create applications with chats inside them having messages

## Learning Journey
- This section covers some documentation I made along the way of learning Ruby and Rails from scratch and still have far more to go through. May it help anyone as it will surely do with me in the future

- Ruby
  https://luxurious-ash-b24.notion.site/Ruby-b29719d95ae6421397f507417e663796?pvs=4

- Ruby on Rails
  https://luxurious-ash-b24.notion.site/Ruby-on-Rails-c81513ef53c54ad0940fff09cc86e375?pvs=4

- Docker
  https://luxurious-ash-b24.notion.site/Docker-3e877eb382c843589d48f33a45c1ff48?pvs=4

## Versions
Ruby 3.3.1
Rails 7.1.3
MySQL2 0.5
ElasticSearch 8.13.4

## Getting Started
- Unfortunately our Docker Compose file still has an issue connecting the mysql container to the Rails container

- To start Rails app
/code rails s

- To start MySQL
/code mysql.server run
* MySQL faced connection issues if rails new app -d=mysql wasn't the initial creation command of Rails, no matter adding it to Gemfile to install later as a gem

- To start Elasticsearch
https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
* brew package manager version is v6 which is now outdated
* Manual adding of the zip file in the local directory didn't work either

