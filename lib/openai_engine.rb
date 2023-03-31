require 'openai'

class OpenAIEngine
  attr_reader :openai

  def initialize
    @openai = OpenAI::Client.new
  end

  def response(input)
    Rails.logger.info("Asking #{self.class.name} to respond")
    text = generate_response(input)
    Rails.logger.info("Response: #{text}")
    text
  end

  def generate_response(input)
    raise NotImplementedError
  end

  private 

  def temperature
    0.7
  end

  def model
    "gpt-3.5-turbo"
  end
end
