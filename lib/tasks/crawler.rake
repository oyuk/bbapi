desc 'scraping'
task scraping: :environment do

    url = "http://baseball.yahoo.co.jp/npb/schedule/?&date=" + Date.yesterday.strftime("%Y%m%d")

    page = Mechanize.new.get(url)
    doc = Nokogiri::HTML.parse(page.body)

    teams = []
    startTimes = []
    ballParks = []
    homeScores = []
    awayScores = []
    gameScores = []
    innings = []
    pitchers = []

    doc.xpath('//table[@class="yjMS mb5"]/tr').each do |node|
      # team
      node.xpath('td[@class="today pl7"]/a').each do |elem|
        teams.push(elem.text)
      end

      # time ballPark
      node.xpath('td[@class="today pl7"]/em').each do |elem|
        /(\d{2}:\d{2})(.+)/ =~ elem.text
        startTimes.push($1)
        ballParks.push($2.strip)
      end

      # score inning
      node.xpath('td[@class="today ct"]').each do |elem|
        if /(\d+) - (\d+)/ =~ elem.text
          homeScores.push($1)
          awayScores.push($2)
          gameScores.push(elem.text)
        elsif elem.text == "-" #中止の場合
          homeScores.push("")
          awayScores.push("")
          gameScores.push("")
        end

        elem.xpath('a').each do |e|
          if e.text == "結果"
            innings.push("終了")
          else
            innings.push(e.text)
          end
        end
      end

      # pitchers
      node.xpath('td[@class="today"]').each do |elem|
        if e = elem.xpath('table/tr')
          pitchers.push({
                          Win: e.xpath('td[@class="w"]').text.gsub(/勝[[:space:]]/,""),
                          Save: e.xpath('td[@class="s"]').text.gsub(/S[[:space:]]/,""),
                          Lose: e.xpath('td[@class="l"]').text.gsub(/敗[[:space:]]/,"")
                        })
        else
          pitchers.push({
                          Win: "",
                          Save: "",
                          Lose: ""
                        })

        end
      end
    end

    game_date = GameDate.new(game_date:Date.yesterday)

    if game_date.save
      (teams.size/2).times do |i|
        home = teams[i * 2]
        away = teams[i * 2 + 1]
        home_score = homeScores[i]
        away_score = awayScores[i]
        game_score = gameScores[i]
        start_time = startTimes[i]
        ball_park = ballParks[i]
        inning = innings[i]
        win_p = pitchers[i][:Win]
        save_p = pitchers[i][:Save]
        lose_p = pitchers[i][:Lose]

        game_date.games.create(
          home:home,
          away:away,
          home_score:home_score,
          away_score:away_score,
          game_score:game_score,
          start_time:start_time,
          ball_park:ball_park,
          inning:inning,
          win_pitcher:win_p,
          save_pitcher:save_p,
          lose_pitcher:lose_p
        )

        p "game      #{i + 1}"
        p "home      #{home}"
        p "away      #{away}"
        p "start     #{start_time}"
        p "ballPark  #{ball_park}"
        p "homeScore #{home_score}"
        p "awayScore #{away_score}"
        p "gameScore #{game_score}"
        p "inning    #{inning}"
        p "win       #{win_p}"
        p "save      #{save_p}"
        p "lose      #{lose_p}"
        p "----------------------"
      end
    end

end
