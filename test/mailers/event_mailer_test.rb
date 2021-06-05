require 'test_helper'

class EventMailerTest < ActionMailer::TestCase
  test "notify14" do
    mail = EventMailer.notify14
    assert_equal "Notify14", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
