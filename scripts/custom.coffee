module.exports = (robot) ->
    robot.respond /are you a dude/i, (res) ->
        res.send "I'm not sure, but I do enjoy Guinness."

    robot.respond /wish (.*) a happy birthday/i, (res) ->
        birthdayKid = res.match[1]
        res.send "Happy Birthday to you!\nHappy Birthday to you!\nHappy Birthday dear #{birthdayKid},\nHappy Birthday to you!"

    robot.respond /du hast mich/i, (res) ->
        res.send "Nein!"

    robot.respond /dilbert me ?(.*)?/i, (msg) ->
        url = 'http://dilbert.com'
        if msg.match[1]?
          comicDateRegexp = /\d\d\d\d-\d\d-\d\d/
          if not comicDateRegexp.exec(msg.match[1])?
            msg.send("I do not understand '#{msg.match[1]}' as a date.")
            return
          url = "#{url}/strip/#{msg.match[1]}"
        msg.http(url)
          .get() (err, res, body) ->
            if err
              msg.send "Sorry, I can't do that."
              return
            rx1 = /img-responsive.*>/
            rx2 = /http:[^"]*/
            img = rx2.exec(rx1.exec(body)).toString()
            msg.send("#{img}.png")
            
