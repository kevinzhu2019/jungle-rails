RSpec.describe User, type: :model do
  describe 'password validation' do
    # validation tests/examples here
    it "password and password confirmation fields should be identical" do
      user = User.new(:first_name => "a", :last_name => 'aa', :email => 'a@a.com', :password => 'aaaaaa', :password_confirmation => 'aaaaaa')
      expect(user).to be_valid
    end

    it "password and password confirmation fields should be identical to write to user table" do
      user = User.new(:first_name => "c", :last_name => 'cc', :email => 'c@c.com', :password => 'cccccc', :password_confirmation => 'cccccc').save
      expect(user).to eq(true)
    end
    
    it "password and password confirmation fields not identical cause failure" do
      user = User.new(:first_name => "b", :last_name => 'bb', :email => 'b@b.com', :password => 'bbbbbb', :password_confirmation => 'aaaaaa')
      expect(user).to_not be_valid
    end

    it "password and password confirmation fields not identical prevent from saving to user table" do
      user = User.new(:first_name => "d", :last_name => 'dd', :email => 'd@d.com', :password => 'dddddd', :password_confirmation => 'aaaaaa').save
      expect(user).to eq(false)
    end
  end
end