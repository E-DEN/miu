# Description:
#   cron job

cronJob = require('cron').CronJob
random = require('hubot').Response::random

module.exports = (robot) ->
  task1 = new cronJob
    cronTime: '00 00 20 * * 0,6'
    onTick: ->
      say = 'おはよー' + random [
        '今日は何すんの?'
        '今日もゲーム?'
      ]
      robot.send user, "#{say}"
      return
    start: true
    timeZone: "Asia/Tokyo"

  task2 = new cronJob
    cronTime: '00 50 11 * * 0,6'
    onTick: ->
      say = 'ちょいと寝る。' + random [
        'おやすみ'
        'お疲れ'
        '君達も早く寝なさい'
      ]
      robot.send user, "#{say}"
      return
    start: true
    timeZone: "Asia/Tokyo"

  task3 = new cronJob
    cronTime: '00 00 16 * * 1-5'
    onTick: ->
      say = 'ただいま!' + random [
        ' あれ、まだ誰も帰ってない?'
        ' 今日も一日頑張るか!'
      ]
      robot.send user, "#{say}"
      return
    start: true
    timeZone: "Asia/Tokyo"

  task4 = new cronJob
    cronTime: '00 50 07 * * 1-5'
    onTick: ->
      say =   random [
        '行って来まーす'
        '行って来る!!'
      ]
      robot.send user, "#{say}"
      return
    start: true
    timeZone: "Asia/Tokyo"
