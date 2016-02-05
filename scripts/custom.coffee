module.exports = (robot) ->
    robot.respond /are you a dude/i, (res) ->
        res.send "I'm not sure, but I do enjoy Guinness."

    robot.respond /wish (.*) a happy birthday/i, (res) ->
        birthdayKid = res.match[1]
        res.send "Happy Birthday to you!\nHappy Birthday to you!\nHappy Birthday dear #{birthdayKid},\nHappy Birthday to you!"
