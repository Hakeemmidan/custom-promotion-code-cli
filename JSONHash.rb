# class source: https://stackoverflow.com/a/9083443/7974948 
require 'json'

class JSONHash
  
  def self.from(file)
    self.new.load(file)
  end

  def initialize(h={})
    @h=h
  end

  # Save this to disk, optionally specifying a new location
  def save(file=nil)
    @file = file if file
    File.open(@file,'w'){ |f| JSON.dump(@h, f) }
    self
  end

  # Discard all changes to the hash and replace with the information on disk
  def reload(file=nil)
    @file = file if file
    @h = JSON.parse(IO.read(@file))
    self
  end

  # Let our internal hash handle most methods, returning what it likes
  def method_missing(*a,&b)
    @h.send(*a,&b)
  end

  # But these methods normally return a Hash, so we re-wrap them in our class
  %w[ invert merge select ].each do |m|
    class_eval <<-ENDMETHOD
      def #{m}(*a,&b)
        self.class.new @h.send(#{m.inspect},*a,&b)
      end
    ENDMETHOD
  end

  def to_json
    @h.to_json
  end

end
