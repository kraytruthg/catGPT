# catGPT
A chat app integrate with ChatGPT

# How to setup
1. Get API token from [OpenAI](https://beta.openai.com/)
2. Get Line token:
    1. Go to [Line Developers](https://developers.line.biz/en/)
    2. Create a new provider
    3. Create a new channel
    4. Get channel access token and channel secret
3. Rename `template.env` to `.env` and update the value
4. Run `bundle install`

# How to run
1. Run server via `rails s`
2. Start ngrok by running the command `./ngrok http 3000` (assuming your Rails app is running on port 3000). This will create a secure tunnel from the internet to your local machine.
3. Copy the ngrok URL (e.g. https://randomstring.ngrok.io) from the output of the previous command.
4. Set the webhook URL for your Line channel to the ngrok URL by running the following command in your terminal:
  ```
    curl -v -X PUT https://api.line.me/v2/bot/channel/webhook/endpoint \
    -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer YOUR_CHANNEL_ACCESS_TOKEN' \
    -d '{"endpoint": "https://randomstring.ngrok.io/callback"}'
  ```
5. Chat with your bot