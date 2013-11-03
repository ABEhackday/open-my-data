module DatasetsHelper
  def score_color(score)
    if score == nil || score == 3.0
      return "dimgray"
    elsif score > 3.0
      return "forestgreen"
    else
      return "crimson"
    end
  end
end
