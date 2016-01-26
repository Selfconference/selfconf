require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  def test_not_voted_on_by_right_user_no_votes
    submissions = Submission.not_voted_on_by(users(:jack), events(:gdi))

    assert_equal [submissions(:jill_gdi)], submissions
  end
end
