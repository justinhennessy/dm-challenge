module DashboardHelper
  def challenge_countdown
    if Time.now < @challenge.start_date
      content_tag("strong", distance_of_time_in_words(Time.now, @challenge.start_date) + " to start!")
    else
      content_tag("strong", distance_of_time_in_words(@challenge.start_date, Time.now) + " left!")
    end
  end

  def style_deficit
    if @challenge.deficit == 0
      "btn"
    elsif @challenge.deficit < 500
      "btn btn-warning"
    else
      "btn btn-danger"
    end
  end
end
