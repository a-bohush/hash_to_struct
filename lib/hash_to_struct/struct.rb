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
        create_new = -> (v) { is_hash?(v) ? self.class.new(v, **@options) : v}
        h[key] = case
                 when is_hash?(hash[key])
                   create_new.call(hash[key])
                 when @options[:including_arrays] && is_array?(hash[key])
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
                   when is_array?(h[key])
                     h[key].map { |v| v.is_a?(self.class) ? v.to_h : v }
                   else
                     h[key]
                   end
        end
      end
    end

    def is_hash?(val)
      val.class == Hash
    end

    def is_array?(val)
      val.class == Array
    end
  end
end
