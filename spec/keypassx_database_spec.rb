require 'spec_helper'

describe KeypassxDatabase do
  describe 'self.open' do
    it "creates a new instance of the databse with the file" do
      db = KeypassxDatabase.open(TEST_DATABASE_PATH)
      db.should_not be_nil
    end
  end

  describe "unlock" do
    before :each do
      @db = KeypassxDatabase.open(TEST_DATABASE_PATH)
      @db.should be_valid
    end

    it "returns true when the master password is correct" do
      @db.unlock('testmasterpassword').should be_true
    end

    it "returns false when the master password is incorrect" do
      @db.unlock('bad password').should be_false
    end
  end
end