require 'openai'

class OpenAIEngine
  def initialize
    @openai = OpenAI::Client.new
    @model_id = ENV['OPENAI_MODEL_ID']
  end

  def generate_response(message)
    response = @openai.chat(
      parameters: {
        model: @model_id,
        messages: [{ role: "user", content: message }],
        temperature: 0.7
      }
    )

    response.dig("choices", 0, "message", "content")
  end
end
