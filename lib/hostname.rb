# http://hlee.javaeye.com/blog/452049
class Hostname  
  TITLE_REGEXP = /(<title>)([^<]*)(<\/title>)/i
 
  def initialize(app, hostname="")
    @app          = app
    @title_suffix = " - on #{hostname}"
  end
 
  def call(env)
    status, headers, response = @app.call(env)
    add_hostname(response, headers) if headers["Content-Type"] =~ %r{text/html}
    [status, headers, response]
  end  
 
  def add_hostname(response, headers)
    response.each{|s| s.sub!(TITLE_REGEXP, "\\1\\2#{@title_suffix}\\3") if s =~ TITLE_REGEXP}
    headers["Content-Length"] = (headers["Content-Length"].to_i + @title_suffix.length).to_s
    nil
  end
end