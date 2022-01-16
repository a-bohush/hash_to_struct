require 'delegate'

module HashToStruct
  class Struct < SimpleDelegator
    def initialize(
          hash,
          builder_class: HashToStruct::StructBuilder,
          immutable: false,
          including_arrays: false
        )
      @options = {
        builder_class: builder_class,
        immutable: immutable,
        including_arrays: including_arrays
      }
      __setobj__(to_struct(hash))
      freeze if immutable
    end

    def to_h
      to_hash
    end

    private

    def to_struct(hash)
      h = hash.each_key.each_with_object({}) do |key, h|
        create_new = -> (hv) { self.class.new(hv, **@options) }
        h[key] = case
                 when hash[key].class == Hash
                   create_new.call(hash[key])
                 when @options[:including_arrays] && hash[key].class == Array
                   hash[key].map(&create_new)
                 else
                   hash[key]
                 end
      end
      @options[:builder_class].build(h)
    end

    def to_hash
      __getobj__.to_h.tap do |h|
        h.keys.each do |key|
          h[key] = case
                   when h[key].is_a?(self.class) then h[key].to_h
                   when h[key].class == Array then h[key].map(&:to_h)
                   else
                     h[key]
                   end
        end
      end
    end
  end
end
