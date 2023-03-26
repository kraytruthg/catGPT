require 'line/bot'

class LineBot
  def initialize
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def reply_text(reply_token, text)
    message = {
      type: 'text',
      text: text
    }
    @client.reply_message(reply_token, message)
  end
end
