module WorkoutsHelper

  def day_of_the_week(week_id)
    return week_set[week_id]
  end

  private
  def week_set
    week = ["オフの日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日"]
  end

end
