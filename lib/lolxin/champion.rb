module Lolxin
  class Champion
    # Idea now is to build a Champion with as much data as possible.
    def initialize(options)
      raise "Expecting Hash argument for Champion constructor" unless options.instance_of? Hash
      raise "Cannot provide an emtpy Hash for Champion constructor" if options.empty?
      options.each do |key, value|
        self.class.send(:attr_reader, key)
        self.instance_variable_set("@#{key}", value)
      end
    end

  end
end
