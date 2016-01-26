require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  def test_not_voted_on_by_with_zero_votes
    result = Submission.not_voted_on_by(users(:jack), events(:gdi))

    assert_equal [submissions(:jill_gdi)], result
  end

  def test_not_voted_on_by_with_same_user_vote
    Vote.create!(user: users(:jack), submission: submissions(:jill_gdi))

    result = Submission.not_voted_on_by(users(:jack), events(:gdi))

    assert_equal [], result
  end

  def test_not_voted_on_by_with_different_user_vote
    Vote.create!(user: users(:jane), submission: submissions(:jill_gdi))

    result = Submission.not_voted_on_by(users(:jack), events(:gdi))

    assert_equal [submissions(:jill_gdi)], result
  end
end
