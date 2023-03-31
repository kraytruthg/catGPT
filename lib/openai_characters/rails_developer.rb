require 'openai_engine'

module OpenAICharacters
  class RailsDeveloper < OpenAIEngine
    def generate_response(input)
      response = openai.chat(
        parameters: {
          model: model,
          temperature: temperature,
          messages: [
            { role: "system", content: prompt },
            { role: "user", content: input }
          ]
        }
      )
      response.dig("choices", 0, "message", "content")
    end
    
    private 

    def prompt
      <<~PROMPT
        Our following discussion would focus on Rails app development. 
        We are pairing programming"
      PROMPT
    end
  end
end