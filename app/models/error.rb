class Error

  attr_accessor :errors
  attr_accessor :model_name
  attr_accessor :model_instance

  @model_name = 'Model'
  @errors = []
  @model_instance

  def ==(comp)
    false
  end

  def initialize(model_name,*args)

    # binding.pry
    @model_name = model_name
    @errors = args

    self.create_model_instance(model_name)
  end

  def create_model_instance(model_name)
    @model_instance = eval "#{model_name.capitalize()}.new"

    if @errors and @errors.size > 0
      @errors.each do |e|
        @model_instance.errors.add(:base,e)
      end
    end

  end

  def model_name
    @model_name
  end

end