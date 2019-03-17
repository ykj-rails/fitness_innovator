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

  def resize_m(img)
    return img.variant(combine_options: { resize:"480x480^", crop:"480x480+0+0", gravity: :center }).processed
  end
end
