=begin

  Pusher class: this class is used as a database transactions-handler abstraction module.
  This class handles User Actions and Features that requires to push a transaction to the DB.

  Uses: x class.

  - This class will be injected in some method for the controllers that require it.
  - Redirect required GET/PUT/POST/DELETE methods controllers to Pusher Module

=end

class Pusher

  # =================================================================
  #
  # This method overrides the implementation of method_missing
  # it will be called to generate methods dynamically, so we can:
  #
  # Pusher.<action>_<model> <params/attrs>
  #
  # This will exeute the desired action on the specified model.
  # It can be done on any model, so if we say:
  #
  # Pusher.update_anime params
  #
  # The pusher will try to obtain valid attributes for an anime
  # and use the to update the model.
  #
  # =================================================================

  def self.method_missing(meth, *args, &block)
    # If we received empty args then return nil
    if args.size == 1 and args[0].nil?
      return {errors: ['Invalid or empty params!']}
    end

    # Compares method name with regexp and separates
    # the matched strings for method arguments.
    #
    if meth.to_s =~ /^(.+)_(.+)$/
      self.action_model($1, $2, *args, &block)
    else
      super
    end
  end

  # =================================================================
  #
  # This method will use the arguments from method_missing
  # to execute an action on the model.
  #
  # Pusher.update_anime <params>
  #
  # =================================================================
  def self.action_model(action, model, *args, &block)
    args = args[0] if args[0].kind_of?(Hash)
    # binding.pry
    args = Hash(args)
    return eval "self.#{action}_model(\"#{model}\",#{args})" # call action_{model}
  end

  # =================================================================
  #
  # The following methods handles transactional logic for matching model
  # name on database for its corresponding <action> name.
  #
  # Pusher.create_model('anime',*args,&block)
  #
  # =================================================================
  def self.create_model(model, args, &block)
    model = eval "return #{model.capitalize()}.new(#{args})"
    model.save
    return model
  end

  def self.update_model(model, args, &block)
    eval "#{model} = Finder.find_#{model}_by_id(#{args[:id]}).first"
    eval "#{model}.update_attributes #{args}[:#{model}]"
    return eval "#{model}"
  end

  def self.destroy_model(model, args, &block)
    eval "#{model} = Finder.find_#{model}_by_id(#{args[:id]}).first"
    return eval "#{model}.destroy"
  end
  #
  # def self.create_anime attrs
  #   anime = Anime.new(attrs)
  #   anime.save
  #   anime
  # end
  #
  # def self.update_anime params
  #   anime = Finder.find_anime_by_id(params[:id]).first
  #   anime.update_attributes params[:anime]
  #   anime
  # end
  #
  # def self.destroy_anime params
  #   @anime = Finder.find_anime_by_id(params[:id]).first
  #   @anime.destroy
  # end
  #
  # def self.destroy_studio(params)
  #   # code here
  # end
  #
  # def self.update_studio(params)
  #   # code here
  # end
  #
  # def self.create_studio(i)
  #   # code here
  # end
end
