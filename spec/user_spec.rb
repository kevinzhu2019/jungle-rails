RSpec.describe User, type: :model do
  describe 'password validation' do
    # validation tests/examples here
    it "password and password confirmation fields should be identical" do
      user = User.new(:first_name => "a", :last_name => 'aa', :email => 'a@a.com', :password => 'aaaaaa', :password_confirmation => 'aaaaaa')
      expect(user).to be_valid
    end

    it "password and password confirmation fields should be identical to write to user table" do
      user = User.new(:first_name => "j", :last_name => 'jj', :email => 'j@j.com', :password => 'cccccc', :password_confirmation => 'cccccc').save
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

  describe 'email validation' do
    it "is invalid if 2 emails are identical" do
      user = User.new(:first_name => "k", :last_name => 'kk', :email => 'k@k.com', :password => 'eeeeee', :password_confirmation => 'eeeeee').save
      expect(user).to eq(true)
      user2 = User.new(:first_name => "l", :last_name => 'll', :email => 'K@K.com', :password => 'ffffff', :password_confirmation => 'ffffff').save
      expect(user2).to eq(false)
    end
  end

  describe 'email, first name, last name should not be empty' do
    it "is invalid if email is nil" do
      user = User.new(:first_name => "m", :last_name => 'mm', :email => nil, :password => 'eeeeee', :password_confirmation => 'eeeeee')
      expect(user).to_not be_valid
    end

    it "is invalid if first name is nil" do
      user = User.new(:first_name => nil, :last_name => 'mm', :email => 'm@m.com', :password => 'eeeeee', :password_confirmation => 'eeeeee')
      expect(user).to_not be_valid
    end

    it "is invalid if last name is nil" do
      user = User.new(:first_name => 'firstName', :last_name => nil, :email => 'm@m.com', :password => 'eeeeee', :password_confirmation => 'eeeeee')
      expect(user).to_not be_valid
    end
  end
end