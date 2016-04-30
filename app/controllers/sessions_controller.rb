require "net/http"
require "uri"
class SessionsController < ApplicationController

  before_filter :authenticate_user, :except => [:login, :login_attempt]
  before_filter :save_login_state, :only => [:login, :login_attempt]
  layout "application"

  def login

  end

  def login_attempt

    authorized_user = User.authenticate(params[:username],params[:login_password])

    if authorized_user
      session[:user_id] = authorized_user.id

      redirect_to(:controller => 'sessions', :action => 'home')

    else


      render "login"
    end
  end

  def problem_submit

   create_prob


  end

  def create_prob

    @prob = Problem.new(probs_params)

    if @prob.save

      redirect_to(:controller => 'sessions', :action => 'home')
    else

      redirect_to(:controller => 'sessions', :action => 'profile')
    end

    #redirect_to(:controller => 'sessions', :action => 'home')

  end

  def new_prob
    @prob = Problem.new()

  end

  def probs_params
    params.require(:prob).permit(:probText, :input, :output)

  end

  def create_subl

    @subl = Submission.new(subl_params)

    @subl.userId = @current_user.id
    @subl.result = "waiting for judgement"
    @client = JenkinsApi::Client.new(:server_ip => '127.0.0.1',
                                     :username => '', :password => '')

    inpt = Problem.find(@subl.problemId)



    job_params = {"input" => inpt.input ,"output" => inpt.output,
                  "code" => @subl.code}


    opts = {'build_start_timeout' => 30}
    joblId = @client.job.build(@subl.job, job_params, opts )

    @subl.job_id = joblId






    if @subl.save

      redirect_to(:controller => 'sessions', :action => 'home')
    else

      redirect_to(:controller => 'sessions', :action => 'profile')
    end



  end

  def subl_params
    params.require(:subl).permit(:problemId, :code, :job)

  end



  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  def home

  end

  def profile

  end

  #upload
  def setting

  end

  def admin

  end



  def judge

  end


  def poke_jenkins
  # uri = URI.parse("http://localhost:8080/job/ruby%20interpriting%20maybe/buildWithParameters?code=puts%20%22do%20work%22")
   # response = Net::HTTP.get_response(uri)

   # Net::HTTP.get_print(uri)

   #http = Net::HTTP.new(uri.host, uri.port)
   #response = http.request(Net::HTTP::Get.new(uri.request_uri))

  # Rails.logger.debug("debug::" +  response.body)




   @client = JenkinsApi::Client.new(:server_ip => '127.0.0.1',
                                    :username => '', :password => '')



   subls = Submission.all

   subls = Submission.all

   i = subls.size
   x = 0
   while x< i
   if subls[x].result == "waiting for judgement"

     joblid = subls[x].job_id
     jobname = subls[x].job

      uri = URI.parse("http://localhost:8080/job/"+ jobname.to_s+"/"+joblid.to_s+"/artifact/output.txt")
     response = Net::HTTP.get_response(uri)

     if response.body.to_s.strip == "success"

       subls[x].result = "success"
       subls[x].save


     else

       subls[x].result = "failure"
       subls[x].save

     end





    # http://localhost:8080/job/cSharp1/28/artifact/output.txt
     #artfacts = []
     # artfacts = didwork["artifacts"]

     Rails.logger.debug("pie")

   end



   x = x+1
   end



   ###########C:\Windows\Microsoft.NET\Framework\v4.0.30319>

   redirect_to(:controller => 'sessions', :action => 'home')
  end

end
