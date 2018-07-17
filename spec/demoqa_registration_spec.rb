require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
    end

    it 'should accept a first name' do
      @driver.first_name_field_displayed
      @driver.set_first_name_field('Ben')
      expect(@driver.get_first_name_field_value).to eq 'Ben'
    end

    it 'should accept a last name' do
      @driver.last_name_field_displayed
      @driver.set_last_name_field('Tostevin')
      expect(@driver.get_last_name_field_value).to eq 'Tostevin'
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      expect(@driver.select_marital_option('not married')).to be false
      expect(@driver.select_marital_option('Married')).to be nil
      @driver.select_marital_option('Single')
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      @driver.select_hobby_option(['Dance', 'Cricket'])
      expect(@driver.select_hobby_option(['Reading', 'Cricket'])).to match_array [false, true, true]
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country).to eq 'Afghanistan'
    end

    it 'should accept a new country value' do
      @driver.set_country_name_field('United Kingdom')
      expect(@driver.get_selected_country).to eq 'United Kingdom'
    end

    it 'accept a new DOB' do
      @driver.set_month('10')
      expect(@driver.get_month).to eq '10'
      @driver.set_day('16')
      expect(@driver.get_day).to eq '16'
      @driver.set_year('1993')
      expect(@driver.get_year).to eq '1993'
    end

    it 'should accept a valid phone number' do
      # @driver.set_phone_number_field('111')
      # expect(@driver(:display => "legend error")[0].style('display')).to eq 'inline-block'
      @driver.set_phone_number_field('441235671111')
      expect(@driver.get_phone_number_field_value).to eq '441235671111'
    end

    it 'should accept a username' do
      @driver.set_user_name_field('Btostevin')
      expect(@driver.get_user_name_field_value).to eq 'Btostevin'
    end

    it 'should accept an email' do
      @driver.set_email_field('Btostevin@spartaglobal.com')
      expect(@driver.get_email_field_value).to eq 'Btostevin@spartaglobal.com'
    end

    it 'should accept a about yourself text' do
      @driver.set_about_yourself_field('This is a description all about how my life got flipped turned upside down')
      expect(@driver.get_about_yourself_value).to eq 'This is a description all about how my life got flipped turned upside down'
    end

    it 'should accept a password' do
      @driver.set_password_field('Password1!')
      expect(@driver.get_password_value).to eq 'Password1!'
    end

    it 'should accept a password confirmation' do
      @driver.set_confirmation_password_field('Password1!')
      expect(@driver.get_confirmation_password_value).to eq 'Password1!'
    end

    it 'should recognise if the password and the confirmed password are identical and if they are not' do
      expect(@driver.passwords_match).to eq true
      @driver.clear_confirm_password_field
      @driver.set_confirmation_password_field('Password2!')
      expect(@driver.passwords_match).to_not eq true
      expect(@driver.password_mismatch_message).to be true
    end

    xit 'should be able to click sumbit' do

    end

  end

end
