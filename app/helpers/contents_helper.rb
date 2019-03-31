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

  def resize_s(img)
    return img.variant(combine_options: { resize:"150x150^", crop:"150x150+0+0", gravity: :center }).processed
  end

  def resize_sm(img)
    return img.variant(combine_options: { resize:"300x300^", crop:"300x300+0+0", gravity: :center }).processed
  end

  def resize_m(img)
    return img.variant(combine_options: { resize:"480x480^", crop:"480x480+0+0", gravity: :center }).processed
  end

  def resize_l(img)
    return img.variant(combine_options: { resize:"460x680^", crop:"680x680+0+0", gravity: :center }).processed
  end
end
