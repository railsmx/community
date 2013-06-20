require 'rack'

module Rack
  class Block
    def initialize(app, &block)
      @blocked_content = []
      instance_eval &block
      @app = app
    end

    def call(env)
      req = Rack::Request.new(env)
      if @blocked_content.detect{|block| req.path_info =~ /#{block}/}
        return [302, {"Content-Type" => "text/html"}, ['']]
      end
      @app.call(env)
    end

    def block(*content)
      @blocked_content.push *content
    end
  end
end
