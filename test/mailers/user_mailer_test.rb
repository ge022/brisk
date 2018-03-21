require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "contact_email" do
    mail = UserMailer.contact_email
    assert_equal "Contact email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "restaurant_email" do
    mail = UserMailer.restaurant_email
    assert_equal "Restaurant email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "welcome_email" do
    mail = UserMailer.welcome_email
    assert_equal "Welcome email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
