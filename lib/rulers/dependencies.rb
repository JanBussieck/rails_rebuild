require 'thread'

class Object
  
  #open file and check whether class exists with same name
  =begin
    file_path = Rulers.to_underscore(c.to_s)
    #open file and see whether
    class_in_file = File.open(file_path).gets.split('<').[0].gsub(/class/,"").strip
  =end
  def self.const_missing(c)
    mutex = Mutex.new
    mutex.synchronize{
      if @calling_const_missing
        @calling_const_missing = false
        return nil
      end
      @calling_const_missing = true
      require file_path
      klass = Object.const_get(c)
      @calling_const_missing = false
      
      klass
    }
  end
  
  class NoSuchClass 
  end
  
end