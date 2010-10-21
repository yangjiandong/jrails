Agile Web Development With Ruby On Rails 3rd
=============================================

2010.10.21
-----------

   1. 清除session
   rake db:sessions:clear

   2. trace log -- 很有用
   tail -f log/development.log

   3. p136

2010.10.20
-----------

   1. Mongrel
   jruby -S gem install mongrel

2010.10.19
-----------

   1. jruby --debug script/server --debugger

   2. session save into database
   --自动生成session表
   rake db:sessions:create
   rake db:migrate

   --2.2 ror environment.rb
   config.action_controller.session_store = :active_record_store
   --2.3 ror config/initializers/session_store.rb
   ActionController::Base.session_store = :active_record_store

   3. add_to_cart 报错
   NoMethodError in StoreController#add_to_cart
   --删除后台sessin表记录即可

   http://forums.pragprog.com/forums/66/topics/1663

   4. p110

2010.10.18
-----------

   1. 产生测试数据

   jruby script/generate migration add_test_data
   编辑add_test_data.rb
   up..
   --生效
   rake db:migrate

   2. p95

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

   5. 增加git仓库 http://github.com/yangjiandong/jrails

   git remote add origin git@github.com:yangjiandong/jrails.git

   git push origin master:refs/heads/master

   $ ssh-keygen
    (ssh-keygen -C "你的email地址" -t rsa)
    Generating public/private rsa key pair.
    Enter file in which to save the key (/Users/schacon/.ssh/id_rsa):
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /Users/schacon/.ssh/id_rsa.
    Your public key has been saved in /Users/schacon/.ssh/id_rsa.pub.
    The key fingerprint is:
    43:c5:5b:5f:b1:f1:50:43:ad:20:a6:92:6a:1f:9a:3a schacon@agadorlaptop.local

   提交时，需将ssh-key 加到 github

   github user:yangjiandong,123456789,young.jiandong@gmail.com

   建立branch 3.3.2
   git branch 3.3.2
   git push origin 3.3.2

   clone
   git clone git://github.com/yangjiandong/jrails.git

2010.10.16
------------

   1. >jruby -S gem install rails -v=2.3.10
      rails _2.3.10_ ce_demo

      database.yml 改为jdbcsqlite3
      jruby script/server

   2. p52

   --END