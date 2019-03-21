module CommentsHelper
  # 最新のコメント4件の取得
  def get_4_comments(comments)
    return comments = comments[-4..-1]
  end
  # 最新のコメント4件を除いたコメントの取得
  def get_remaining_comments(comments)
    return comments = comments[0..-5]
  end
end