module.exports = (robot) ->
    robot.respond /are you a dude/i, (res) ->
        res.send "I'm not sure, but I do enjoy Guinness."

    robot.respond /wish (.*) a happy birthday/i, (res) ->
        birthdayKid = res.match[1]
        res.send "Happy Birthday to you!\nHappy Birthday to you!\nHappy Birthday dear #{birthdayKid},\nHappy Birthday to you!"

    robot.respond /du hast mich/i, (res) ->
        res.send "Nein!"

    robot.respond /dilbert me/i, (msg) ->
        url = 'http://dilbert.com'
        msg.http(url)
          .get() (err, res, body) ->
            if err
              msg.send "Sorry, I can't do that."
              return
            rx1 = /img-responsive.*>/
            rx2 = /http:[^"]*/
            msg.send rx2.exec(rx1.exec(body))
