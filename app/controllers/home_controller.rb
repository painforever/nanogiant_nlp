class HomeController < ApplicationController
  def positive_feedbacks
    res = RestClient.get "#{Constants::BaseUrl}/positive_feedbacks"
    res = JSON.parse(res.body) rescue {}
    @feed_backs = res['result']
  end

  def negative_feedbacks
    res = RestClient.get "#{Constants::BaseUrl}/negative_feedbacks"
    res = JSON.parse(res.body) rescue {}
    @feed_backs = res['result']
  end

  def topics
    res = RestClient.get "#{Constants::BaseUrl}/topics"
    res = JSON.parse(res.body) rescue {}
    @topics = res['result']
  end

  def topic_details
    word = params[:word]
    res = RestClient.get "#{Constants::BaseUrl}/topic_details?word=#{word}"
    res = JSON.parse(res.body) rescue {}
    @feed_backs = res['result']
  end

  def charts
    res = RestClient.get "#{Constants::BaseUrl}/charts"
    res = JSON.parse(res.body)['result'] rescue {}
    @bar_chart_data = [res['bar_chart_hash']['positive'], res['bar_chart_hash']['negative'], res['bar_chart_hash']['neutral']]

    i = 0
    @pie_chart_x = []
    @pie_chart_y = []
    @word_count_chart_data = res['pie_chart_hash']
    @word_count_chart_data.each do |k, v|
      @pie_chart_x << k
      @pie_chart_y << v
      i += 1
      break if i > 10
    end
  end
end
