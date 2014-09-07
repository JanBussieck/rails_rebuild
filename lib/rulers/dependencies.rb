require 'thread'

class Object
  
  
  def self.const_missing(c)
    #fix infinite
      require Rulers.to_underscore(c.to_s)
      klass = Object.const_get(c)
      klass
    
  end
  
  class NoSuchClass 
  end
  
end