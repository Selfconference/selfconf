require "test_helper"

class SessionTest < ActiveSupport::TestCase
  def test_not_voted_on_by_with_zero_votes
    result = Session.not_voted_on_by(speakers(:jack), events(:gdi))

    assert_equal [sessions(:jill_gdi)], result
  end

  def test_not_voted_on_by_with_same_speaker_vote
    Vote.create!(speaker: speakers(:jack), session: sessions(:jill_gdi))

    result = Session.not_voted_on_by(speakers(:jack), events(:gdi))

    assert_equal [], result
  end

  def test_not_voted_on_by_with_different_speaker_vote
    Vote.create!(speaker: speakers(:jane), session: sessions(:jill_gdi))

    result = Session.not_voted_on_by(speakers(:jack), events(:gdi))

    assert_equal [sessions(:jill_gdi)], result
  end
end
