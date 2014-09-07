require 'erubis'
module Rulers
  
  class Controller
    def initialize(env)
      @env = env
    end
    
    def env
      @env
    end
    
    def render(view_name, locals = {})
      filename = File.join "app", "views", controller_name, "#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new(template)
      
      # create a hash of instance variables to pass on to the view 
      variable_hash = locals[:permit].inject(Hash.new) do |hash, variable|
        instance_var = "@" + variable.to_s
        hash[variable] = self.instance_variable_get instance_var
        hash
      end
      
      eruby.result locals.merge(variable_hash)
    end
    
    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, "")
      Rulers.to_underscore klass
    end
    
  end
  
end