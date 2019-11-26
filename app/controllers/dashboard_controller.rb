class DashboardController < ApplicationController
  protect_from_forgery with: :null_session
  def index
  end
  
  def logon
    if request.post?
      client = Savon.client(
        wsdl:        params["wsdlurl"],
        logger:      Rails.logger,
        log_level:   :debug,
        log:         true
      )
      response = client.call(:logon,
        message: {
          name: params["username"],
          password: params["password"]
        })
      doc = Nokogiri::XML(response.to_s)

      respond_to do |format|
        format.text { render xml: doc.xpath("//sawsoap:sessionID")[0].content }
      end
    end  
  end
  def logoff
    if request.post?
        client = Savon.client(
        wsdl:        params["wsdlurl"],
        logger:      Rails.logger,
        log_level:   :warn,
        log:         true,
        basic_auth: [params["username"], params["password"]]
      )
      response = client.call(:logoff,
        message: {
          sessionID: params["sessionsecret"]
        })
      doc = Nokogiri::XML(response.to_s)

      respond_to do |format|
        format.text { render xml: "success" }
      end
    end
  end
  def keepalive
    if request.post?
        client = Savon.client(
        wsdl:        params["wsdlurl"],
        logger:      Rails.logger,
        log_level:   :warn,
        log:         true,
        basic_auth: [params["username"], params["password"]]
      )
      response = client.call(:keep_alive,
        message: {
          sessionID: params["sessionsecret"]
        })
      doc = Nokogiri::XML(response.to_s)

      respond_to do |format|
        format.text { render xml: "success" }
      end
    end
  end
  def executequery
    if request.post?
        client = Savon.client(
        wsdl:        params["wsdlurl"],
        logger:      Rails.logger,
        log_level:   :warn,
        log:         true,
        basic_auth: [params["username"], params["password"]]
      )
      response = client.call(:execute_sql_query,
        message: {
          sessionID: params["sessionsecret"],
          sql: params["sql"],
          outputFormat: "xml",
          
        })
      doc = Nokogiri::XML(response.to_s)

      respond_to do |format|
        format.text { render xml: "success" }
      end
    end
    
  end
end
