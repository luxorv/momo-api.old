class Error

  attr_accessor :errors
  attr_accessor :model_name
  @model_name = 'Model'
  @errors = []

  def ==(comp)
    false
  end

  def initialize(model_name,*args)

    # binding.pry
    @model_name = model_name
    @errors = args

  end

  def model_name
    @model_name
  end

end