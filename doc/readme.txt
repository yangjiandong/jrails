JRuby + ROR3
===================

210.12.06
----------

   1. mongrel & apache on jruby
   http://www.javaeye.com/wiki/rails_weekly/1811-rails-questions-weekly-3-mongrel-and-apache-on-jruby 
   save/mongrel_apache_jruby.txt

2010.12.03
----------

   1. comet
   https://github.com/maccman/juggernaut 

2010.12.02
----------

   1. Ruby语言轻松编写网页蜘蛛 
   save\nokogiri_test.rb
   gem install nokogiri --pre --no-rdoc --no-ri  

2010.11.30
----------

   1. 基于web飞信接口的飞信应答机器人
   http://methodmissing.javaeye.com/blog/824993
   save\fetion-robot.rb
   --jruby -rubygems fetion-robot.rb 运行没成功

   2. save\get_gmail.rb 
   取gmail,运行也没成功,认证不了.

2010.11.26
----------

   1. 初学ruby,掌握的方法,有空多看看,体会一下
   save\begin_ruby.txt
   http://www.cnblogs.com/wanana/archive/2010/02/05/1664104.html  

2010.11.24
----------

   1. rails 3 route
   save/Ruby on Rails Guides  Rails Routing from the Outside In.htm

2010.11.20
----------

   1. warble 打包
      参考 http://caldersphere.rubyforge.org/warbler/Warbler/Config.html
      已支持compile
      warble config
      edit config/warble.rb
         config.features = %w(compiled executable)
	 config.compiled_ruby_files = FileList['app/**/*.rb']

2010.11.19
----------

   1. 工作流
   ruote
   https://github.com/jmettraux/ruote-kit
   save\ruote.txt
   rackup 运行后,访问http://localhost:9292/_ruote

   install on jruby
   http://groups.google.com/group/openwferu-users/browse_thread/thread/e90bf69f6ad8cf65


2010.11.15
----------

   1. html to haml
   --http://net7sviluppo.com/trac/talia/attachment/wiki/TaliaInstallation/hpricot-0.8.255-jruby.gem
   --gem install ..gem
   --gem install ruby_parser
   html2haml -rx login.rhtml

2010.11.14
----------

   1. 格式化输出
   awesome_print
   http://gooss.org/ruby-output-format/
   https://github.com/michaeldv/awesome_print

   irb:
   --_irbrc
require "rubygems"
require "ap"

unless IRB.version.include?('DietRB')
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
else # MacRuby
  IRB.formatter = Class.new(IRB::Formatter) do
    def inspect_object(object)
      object.ai
    end
  end.new
end

   raisl log:
   logger.ap object
   or
   logger.ap object, :warn
   in template:
   <%= ap @accounts.first %>

   2. 终端下彩色输出
   win32 下采用cygwin

   $ ruby -e 'print "\e[31mABCD"' 
   win32console 方案需本地编译

2010.11.13
----------

   1. jruby 启动参数 
   -Xmx1024m -Xms512m -Djruby.thread.pooling=true -Djruby.objectspace.enabled=false

   2. ruby jruby 性能
   https://github.com/acangiano/ruby-benchmark-suite.git
   http://programmingzen.com/2010/07/19/the-great-ruby-shootout-july-2010/

2010.11.12
----------

   1. memcache
   http://docs.heroku.com/memcache

   --use memcache 1.4
   https://github.com/mperham/dalli

   --memcached-client
   https://github.com/ikai/jruby-memcache-client

   --memcache 测试,memcached 性能最好
   http://evan.tiggerpalace.com/articles/2010/10/25/memcache-client-vs-memcached-2010/

   2. rails 自带cache
# script/console
Rails.cache.write('date', Date.today)
Rails.cache.read('date')
Rails.cache.fetch('time') { Time.now }
cache = ActiveSupport::Cache.lookup_store(:mem_cache_store)
cache.fetch('time') { Time.now }
c = Category.first
c.cache_key # => "categories/1-20080622195243"

2010.11.11
----------

   1. 用户认证
   authlogic
   https://github.com/binarylogic/authlogic

   用户权限
   cancan
   https://github.com/ryanb/cancan

   Devise
   http://railscasts.com/episodes/209-introducing-devise

   2. 
   http://www.engineyard.com/blog/2010/monitoring-the-jvm-heap-with-jruby/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed:+engineyard+(Engine+Yard)


2010.11.07
----------

   1. save\UUID.TXT

2010.11.07
----------

   1. save\jdbc.txt

   2. data dump

   rake db:data:dump   ->   Dump contents of Rails database to db/data.yml
   rake db:data:load   ->   Load contents of db/data.yml into the database

   --for rails3
   https://github.com/ludicast/yaml_db 
   Simply add to your Gemfile:
   gem 'yaml_db'
   All rake tasks will then be available to you.

   --for rails2.3
   http://blog.anlek.com/2010/03/uninitialized-constant-railsrailtie/
   in my environment.rb make sure you have both these lines in:
   config.gem "inherited_resources", :version => "1.0.2"
   config.gem "responders", :version => "0.4.2"

2010.11.05
----------

   1. jruby on rails deploy to tomcat
   http://barefootdevelopment.blogspot.com/2007/07/jruby-on-rails-performance.html

   use jndi
   add a META-INF directory by the rails app,
   with the follow context.xml file:

<Context path="/myapp" reloadable="true" crossContext="true">
  <!-- Database Connection Pool -->
    <Resource name="jdbc/myapp"
           auth="Container"
           type="javax.sql.DataSource"
           factory="org.apache.tomcat.dbcp.dbcp.BasicDataSourceFactory"
           maxWait="1000"
           removeAbandoned="true"
           maxActive="30"
           maxIdle="10"
           removeAbandonedTimeout="60"
           logAbandoned="true"
           username="myuser"
           password="mypass"
           driverClassName="com.mysql.jdbc.Driver"
           url="jdbc:mysql://127.0.0.1:3306/myapp_development?autoReconnect=true" />
</Context>

   This is the corresponding database.yml file that tells Rails where to find the connection pool data source:
development:
  adapter: jdbc
  jndi: java:comp/env/jdbc/myapp

production:
  adapter: jdbc
  jndi: java:comp/env/jdbc/myapp

   export JAVA_OPTS="-Xms128m -Xmx512m -Djruby.objectspace.enabled=false -Djruby.jit.enabled=true"

2010.11.01
----------

   1. save\howto-learn-ror.txt

2010.10.29
----------

   1. vim
   http://github.com/kaichen/vim-snipmate-ruby-snippets
   http://www.javaeye.com/topic/494254

   2. 重新定义line_item 表结构
   rails generate migration update_line_item
   rake db:migrate

   3. 直接应用depot_u 代码
   --重建表
   rake db:migrate
   --装载种子数据
   rake db:seed

2010.10.28
----------

   1. jruby and rails3
   http://javaevangelist.blogspot.com/2010/09/jruby-and-rails-3.html
   save/jruby_rails3_begin.txt
   --注意gem install 时用 --no-rdoc --no-ri

   2. save/bundle.txt

   3. p 122

   4. rspec
   http://blog.notahat.com/posts/43

   jruby -S gem install rspec-rails --no-rdoc --no-ri
   script/rails generate rspec:install
   config/application.rb add:
       config.generators do |g|
          g.test_framework :rspec
    end

   save/rspec.txt

2010.10.27
----------

   1. 建立branch ror.2.3.10
   git branch ror.2.3.10
   git push origin ror.2.3.10

   2. rails3
   jruby -S gem install tzinfo builder memcache-client rack rack-test rack-mount erubis mail text-format thor bundler i18n --no-ri --no-rdoc
   jruby -S gem install rails --no-rdoc --no-ri
   jruby -S gem install jruby-openssl jdbc-sqlite3 --no-rdoc --no-ri

   gem install activerecord-jdbc-adapter
   gem install activerecord-jdbcsqlite3-adapter

   3. seeds.rb
   种子数据
   rake db:seed

   4. p103
   jruby task not supported by jdbcsqlite3
   --解决
   http://blog.nicksieger.com/articles/2009/10/12/fresh-0-9-2-activerecord-jdbc-adapter-release
   --rails2
   jruby script/generate jdbc
   --rails3
   rails g jdbc

   jruby1.5.3 下 rake test 报错
   --升级到git 版本, 重新安装 rails3 ,出现其他问题

2010.10.25
----------

   1. 自定义rake
   lib\tasks
   rake db:schema_migrations

   2. 绑定所需rails
   rake rails:freeze:gems
   --好像有点问题，会自动绑定系统最新rails版本

   3. 建立分模块控制器
   jruby script/generate controller Admin::Book index show

   4. 指定主键
   self.primary_key = "isbn"
   后台主键指定名为isbn,代码中还是用id
   book = Lbook.new
   book.id = "0-123-5"
   ..
   book.save
   ..
   book = Lbook.find("0-123-5")
   ..

   composite primary keys: 混合主键

   5. migrations: using native SQL
   p308

   6. sql
   find_by_sql
   p337

   7. magic column names
   p355

   partial updates and dirty bits
   p355
   -- 感觉很有用,可以得到字段修改信息

   Acts as tree
   p390

   8. 大体浏览完ROR3rd,下部准备以typo为学习目标

2010.10.24
----------

   1. 增加用户
   User.create(:name=>'dave',:password=>'dave',:password_confirmation=>'dave')

   2. rest
   jruby script/generate controller info who_bought
   http://localhost:3000/info/who_bought/1
   --xml,
   --jruby -S gem install builder

   curl -H "Accept: application/xml" http://localhost:3000/info/who_bought/1
   --xml 输出

   curl -H "Accept: application/xml" http://localhost:3000/info/who_bought_auto/1
   --自动产生xml

   curl --silent http://localhost:3000/info/who_bought_atom/1.atom
   --atom feed

   curl -H "Accept: application/json" http://localhost:3000/info/who_bought_json/1
   --json

   3. test
   p212

   4. working with the rails framework

2010.10.22
----------

   1. 增加 order, line_items
   rake db:migrate

   2. sqlite3 -line db/development.sqlite3
   会以比较优雅的格式显示查询

2010.10.21
-----------

   1. time jruby script/server
   --记录运行时间

   2. 更快的server
   http://jetty-rails.rubyforge.org/
   jruby -S gem install jetty-rails
   jruby -S jetty_rails
   --运行有问题

   3. 清除session
   rake db:sessions:clear

   4. trace log -- 很有用
   tail -f log/development.log

   5. p136

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
