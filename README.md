# Kbot bot

Test Telegram bot implemented on Golang

### Build

1. In Telegram find BotFather and create/find bot
2. Copy API token and setup it as `TELE_TOKEN` environment variable

```bash
read -s TELE_TOKEN # press Enter and paste token - secure input
export TELE_TOKEN
```

3. Build and run bot
```bash
go build -ldflags "-X="github.com/ViacheslavKruhlov/prometheus-devops/module2/kbot/cmd.appVersion=v.1.0.0
./kbot start
```

4. In Telegram find bot https://t.me/testhellokbot_bot, press 'Start' and send `hello` message
