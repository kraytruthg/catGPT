require 'openai_engine'

module OpenAICharacters
  class EnglishTranslator < OpenAIEngine
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
        I want you to act as an English translator, spelling corrector, and improver. 
        I will speak to you in any language and you will detect the language, translate it and answer in the corrected and improved version of my text, in English.  
        Keep the meaning the same, but make them more literary. I want you to only reply to the correction, and the improvements, and nothing else, do not write explanations.
      PROMPT
    end
  end
end