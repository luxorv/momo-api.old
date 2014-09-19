class Error

  @errors= []
  def new *args

    if args.instance_of? Array
      @errors = args
    else
      @errors.push args
    end


  end

end