class Application

  @@item = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}  #{price}\n"
      end 
    end 

    if req.path=="/items"
      resp.write "You requested this item."
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
