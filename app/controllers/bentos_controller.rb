class BentosController < Devise::SessionsController
  include ActionController::MimeResponds

  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  # Authentication is made by accessing: localhost/otakus/bento
  # using POST method and sending the following:
  # {
  # "otaku":  {
  #     "email":"test@mongo.com",
  #     "password":"password"
  # }
  # }

  def create
    json = get_json request.body.read
    otaku = auth_with_json json

    if otaku
      render :status => 200,
             :json => {:success => true,
                       :info => "Logged in",
                       :data => {:auth_token => otaku.authentication_token}}
    else
      self.failure
    end
  end

  def destroy
    json = get_json request.body.read
    otaku = auth_with_json json

    if otaku
      otaku.update_attribute(:authentication_token, nil)
      render :status => 200,
             :json => {:success => true,
                       :info => "Logged out",
                       :data => {}}
    else
      self.failure
    end
  end

  def failure
    render :status => 401,
           :json => {:success => false,
                     :info => "Login Failed. Please check email and password.",
                     :data => {}}
  end

  def get_json data
    begin
      json = JSON.parse(data)
    rescue
      fake_date = "{\"otaku\":{\"email\":\"email@email.com\",\"password\":\"pass\"}}"
      json = JSON.parse(fake_date)
    end
    json
  end

  def auth_with_json json
    email = json["otaku"]["email"]
    pass = json["otaku"]["password"]

    if not email or not pass
      authed = false
    else
      authed = authenticate email, pass
    end
    authed
  end

  def authenticate(email, password)
    otaku = Otaku.find_for_authentication(:email => email)

    return false if not otaku

    otaku.valid_password?(password) ? otaku : nil
  end

end