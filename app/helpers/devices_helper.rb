module DevicesHelper
	def temperature_data
		if @device.messages
			messages = []
			@device.messages.each do |msg| messages<< {temp: msg.temperature, date: msg.polled_at.utc}  end
			messages.to_json
		end
	end

	def current_device
		@device.to_json
	end

	def min_temperature
		@device.messages.all.minimum(:temperature) if @device.messages
	end

	def max_temperature
		@device.messages.all.maximum(:temperature) if @device.messages
	end

	def average_temperature
		@device.messages.all.average(:temperature).to_i if @device.messages
	end

	def last_temperature
		@device.messages.last.temperature if @device.messages.present?
	end

	def temperature_sum
		@device.messages.sum(:temperature) if @device.messages
	end

	def message_count
		@device.messages.count if @device.messages
	end

	def device_location
		@device.location.to_json
	end
end
