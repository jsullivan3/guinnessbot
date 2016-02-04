module.exports = (robot) ->
    robot.respond /are you a dude/i, (res) ->
        res.send "I'm not sure, but I do enjoy Guinness."
