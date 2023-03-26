require 'line_bot'

class LineBotController < ApplicationController
  def callback
    event = params[:events][0]
    # Get the incoming message from the request
    message = event[:message][:text]

    # Define the response message
    response = { type: 'text', text: "Meow, you said: #{message}" }

    # Send the response message back to the user
    client.reply_message(event['replyToken'], response)

    head :ok
  end

  private 

  def client
    LineBot.new.client
  end
end