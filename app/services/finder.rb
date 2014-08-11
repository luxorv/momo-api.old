=begin

  Finder class: this class is used for finding anything on the system.
  Uses: x class.

=end

class Finder

  def self.method_missing(meth, *args, &block)

    if meth.to_s =~ /^find_(.+)_by_(.+)$/
      self.find_by_method($1, $2, *args, &block)
    else
      super
    end
  end

  def self.find_by_method(model, attrs, *args, &block)

    model = model.capitalize

    attrs = attrs.split('_and_')

    attrs_with_args = [attrs, args].transpose

    conditions = Hash[attrs_with_args]

    return eval "#{model.capitalize}.where(#{conditions})"
  end
end
