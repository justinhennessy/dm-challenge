module DashboardHelper
  def challenge_countdown
    if Time.now < @challenge.start_date
      content_tag("strong", distance_of_time_in_words(Time.now-1.days, @challenge.start_date) + " to start!")
    else
      content_tag("strong", distance_of_time_in_words(@challenge.end_date, Time.now-1.days) + " left!")
    end
  end

  def style_deficit
    @challenge.deficit > 100 ? "btn-danger" : @challenge.deficit == 0 ? "" : "btn-warning"
  end

  def style_challenge
    @challenge.deficit == 0 ? "btn-success" : ""
  end
end
