Agile Web Development With Ruby On Rails 3rd
=============================================

2010.10.17
------------

   1. ENTERPRISE RECIPES WITH RUBY AND RAILS

   2. First steps in Rails: How to render a list of records from a table
   
   http://snippets.dzone.com/posts/show/12487?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed:+dzone/snippets+(DZone+/+Snippets)

   3. Depot 

      --采用sqlite3,不需要手工生成
      rake db:create RAILS_ENV='development'
      
      jruby script/generate scaffold product title:string description:text image_url:string
      rake db:migrate
      --增加字段
      jruby script/generate migration add_price_to_product price:decimal
      --后台生成相应表
      rake db:migrate
      --重新生成
      rake db:migrate VERSION=0
      rake db:migrate

   4. p83

2010.10.16
------------

   1. >jruby -S gem install rails -v=2.3.10
      rails _2.3.10_ ce_demo

      database.yml 改为jdbcsqlite3
      jruby script/server 
   
   2. p52

   --END