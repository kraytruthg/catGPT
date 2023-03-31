require 'openai_engine'

module OpenAICharacters
  class Explainer < OpenAIEngine
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
      "請使用繁體中文，利用淺顯易懂的方式，生活化的比喻，說明輸入的內容，受眾是4歲兒童"
    end
  end
end