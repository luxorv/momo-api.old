=begin

  Finder class: this class is used for finding anything on the system.
  Uses: x class.

=end

class Finder

  # =================================================================
  #
  # This method overrides the implementation of method_missing
  # it will be called to generate methods dynamically, so we can:
  #
  # Finder.find_anime_by_name <name>
  #
  # This will look for any anime with the name <name>
  #
  # It can be done on any model, so if we say:
  #
  # Finder.find_manga_by_genre :action
  #
  # The finder will search for all mangas with that genre. The method
  # recieves the method name and its arguments for searching, its
  # accepted patterns are:
  #
  # - Finder.find_<model_name>_by_<attribute_model> <argument>
  # - Finder.search_<model_name> <argument>
  #
  # The last one will search <model_name> for a model with a keyword
  # <argument> in it.
  #
  # =================================================================

  def self.method_missing(meth, *args, &block)

    # Compares method name with regexp and separates
    # the matched strings for method arguments.
    #
    if meth.to_s =~ /^find_(.+)_by_(.+)$/
      self.find_by_method($1, $2, *args, &block)
    elsif meth.to_s =~ /^search_(.+)$/
      self.full_search($1, *args, &block)
    else
      super
    end
  end

  # =================================================================
  #
  # This method will use the arguments from method_missing
  # to make a query on the model provided building a condition from
  # the arguments.
  #
  # Finder.find_anime_by_name <name>
  #
  # =================================================================

  def self.find_by_method(model, attrs, *args, &block)

    model = model.capitalize

    attrs = attrs.split('_and_') # here we separate attributes on methodname
    args = args[0] if args[0].kind_of?(Array)

    attrs_with_args = [attrs, args].transpose # unite attributes and arguments
    conditions = Hash[attrs_with_args] # make a hash with { attr => arg }

    return eval "#{model.capitalize}.where(#{conditions})" # query on the model
  end

  # =================================================================
  #
  # This method makes a query on any model provided that has any of
  # the arguments on its keywords.
  #
  # - Finder.search_<model_name> <argument>
  #
  # =================================================================

  def self.full_search(model, *args, &block)
    model = model.capitalize
    args = args[0] if args[0].kind_of?(Array)

    return eval "#{model}.full_text_search(#{args})"
  end
end
