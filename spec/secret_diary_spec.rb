require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do

  let (:diary) { double :diary }
  subject { SecretDiary.new(diary) }

  context "when locked" do

    it "refuses to be read" do
      expect(subject.read).to eq "Go away!"
    end

    it "refuses to be written" do
      expect(subject.write("Hello")).to eq "Go away!"
    end
  end

  context "when unlocked" do

    before (:each) do
      subject.unlock
    end

    it "gets read" do
      expect(subject).to receive (:read)
      diary.read
    end

    it "gets written" do
      expect(subject).to receive (:write)
      diary.write("Hello")
    end

  end
end