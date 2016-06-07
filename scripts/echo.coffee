# Description:
#   bot echo

random = require('hubot').Response::random
cheerio = require 'cheerio'
request = require 'request'

module.exports = (robot) ->
  robot.hear /おはよ/i, (msg) ->
    msg.send 'おはよー'

  robot.hear /美羽|みう/i, (msg) ->
    say = random [
      'ヒマだな。なんか面白いことない?'
      'なんじゃ'
      '今美少女呼んだ?'
    ]
    msg.send "#{say}"

  robot.hear /lgtm/i, (msg) ->
    url = 'http://www.lgtm.in/g/'
    request url, (error, res) ->
      return if error
      $ = cheerio.load res.body
      src = $('.thumbnail img').attr 'src'
      msg.send "LGTM!!\n#{src}"

  # うんち
  robot.hear /といれ|トイレ|おしっこ|うんち|うんこ/i, (msg) ->
    say = random [
      ':shit:'
      'うんち出た!? :taba:'
    ]
    msg.send "#{say}"

  # Create Issue
  robot.hear /^issue ([^\s]+)\s?([^\s]+)?/i, (msg) ->
    title = msg.match[1]
    body = msg.match[2]
    token = process.env.HUBOT_GITHUB_TOKEN
    query = JSON.stringify({
      'title': title
      'body': body
      'assignee': 'shyazusa'
      'labels': ['other']
    })
    url = "https://api.github.com/repos/shyazusa/miu/issues?access_token=#{token}"
    robot.http(url)
      .post(query) (err, res, json) ->
        ret = JSON.parse json
        say = "来世に期待しとけ。\n#{title}\n#{ret.html_url}"
        msg.send "#{say}"
