# Description:
#   Create hangouts with Hubot.
#
# Commands:
#   hubot hangout me <title> - Creates a Hangout with the given title and returns the URL.
#
# Configuration:
#   HUBOT_GOOGLE_HANGOUTS_DOMAIN: Google Apps domain used as a scope for
#   generating hangout URLs restricted to that domain, default is a public event.

hangoutsDomain = if process.env.HUBOT_GOOGLE_HANGOUTS_DOMAIN then "/${process.env.HUBOT_GOOGLE_HANGOUTS_DOMAIN}" else "event"

module.exports = (robot) ->
  robot.respond /hangouts?( me)?\s*"?(.*?)"?$/i, (msg) ->

    console.log msg.match
    console.log msg.message.user
    title = "#{msg.match[2] || msg.message.user.name}-#{+new Date()}"
    slug  = title.replace(/[^0-9a-z-]+/gi, '-')
    # https://plus.google.com/hangouts/_/event/cnl76k2pj01gb3b3jr906pmaioc?authuser=0&hl=en
    msg.send "I've started a Hangout! Join here: https://plus.google.com/hangouts/_/#{hangoutsDomain}/#{slug}"

