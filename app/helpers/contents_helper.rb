module ContentsHelper
  def weight_difference(before,after)
    diff = before - after
    if 0 <= diff
      diff = "-#{diff}"
    else
      diff = "+#{diff * -1}"
    end
    return diff
  end
end
