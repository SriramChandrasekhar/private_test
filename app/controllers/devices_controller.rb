class DevicesController < ApplicationController

  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
  
  end

  def create

  end

  def destroy
  
  end

  def edit

  end

  def update
    
  end

  def get_data
    if params[:start_date].present?
      #@messages = Device.find(params[:device_id]).messages.where("DATE(polled_at) BETWEEN ? AND ?",params[:start_date], params[:end_date])
      @messages = Device.find(params[:device_id]).messages.where("polled_at <= ? AND polled_at >= ?",params[:end_date],params[:start_date])
    else
      case params[:range]
        when "1M"
          date = 1.month.ago
        when "3M"
          date = 3.months.ago
        when "6M"
          date = 6.months.ago
        when "1Y"
          date = 1.year.ago
        else
          @messages = Device.find(params[:device_id]).messages
      end
      
      @messages ||= Device.find(params[:device_id]).messages.where("DATE(polled_at) BETWEEN ? AND ?",date,Time.zone.now)
    
    end
   
    messages = []
    
    @messages.each do |msg| messages<< {temp: msg.temperature, date: msg.polled_at}  end
    puts "coming here!!!!"
    puts "device value:::::::#{params}"
    render :json => {messages: messages}
  end
end
