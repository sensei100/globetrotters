
  def create_review
    @review.user_id = current_user.id
    current_user.review_count += 1
    current_user.save
    @review.save
    redirect_to @review
  end