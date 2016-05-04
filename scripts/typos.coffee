module.exports = (robot) ->
    robot.hear /(guinnesbot|giunnessbot|guinessbot|guinesbot)/i, (res) ->
        res.send("My name is Guinnessbot, thank you very much.")
