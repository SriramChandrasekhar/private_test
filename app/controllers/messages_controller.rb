class MessagesController < ApplicationController
 skip_before_filter :verify_authenticity_token, :only => [:send_email, :create]
 #before_action :send_alert_email, :only => [:create]
 
 def create
   Message.create(temperature: params[:temperature], device_id: 1, polled_at: Time.at(params[:timetoken].to_i).to_datetime)
   puts "params::::::#{params[:temperature]} #{params[:timetoken]}" 
   puts "coming to create::::::::::::::::"
   render json: {status: "success"}
 end

 def send_alert_email
    EmailNotificationWorker.perform_async()
    render json: {status: "success"}
  end

end
