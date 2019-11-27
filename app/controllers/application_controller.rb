class ApplicationController < ActionController::Base
  before_action :app_up
  
  private
  
    def app_up
      begin
        site_up  = Property.where(key: "SITE_UP").first.value == "UP" ? true : false
      rescue Exception => e
        site_up = false  
      end
        if site_up == true
          redirect_to :root
        else
          redirect_to "/down.html"
        end
    end

end
