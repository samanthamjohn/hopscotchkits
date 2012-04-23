require 'spec_helper'
feature "hopscotch kits flow", js: true do
  before do
    require File.expand_path(Rails.root.join("db/seeds.rb"), __FILE__)
  end

  scenario "claiming a program"
  scenario "logging in and completing a kit" do

    steps = Kit.find_by_slug("puppy").steps.order("position ASC").all
    visit new_kit_program_path(kit_id: 'puppy')
    fill_in "What's it called?", with: "Samantha"
    click_on "Start coding"

    # step 1
    within ".preface > h1" do
      page.should have_content('Step 1: ')
      within "span.subtitle" do
        page.should have_content(steps[0].title)
      end
    end

    within ".specs" do
      page.should have_css("div.unchecked")
      page.should have_content(steps[0].requirements.first.name)
    end

    page.execute_script("window.editor.getSession().setValue('#{steps[0].solution}')")
    click_on("run this")
    within_frame('stage') do
      Nokogiri::HTML.parse(page.body).css('svg')
    end
    within ".progress .success" do
      page.should have_content(steps[0].success_message)
    end

    # step 2
    click_on("next step >>")
    within ".preface > h1" do
      page.should have_content('Step 2: ')
      within "span.subtitle" do
        page.should have_content(steps[1].title)
      end
    end

    page.execute_script("window.editor.getSession().setValue('#{steps[1].solution.gsub("\r", ";").gsub("\n", ";")}')")
    click_on("run this")
    within ".progress .success" do
      page.should have_content(steps[1].success_message.gsub(/<(\W|\w)(\w)+>/, '').strip)
    end

    steps[2, (steps.length - 3)].each do |step|
      click_on "next step >>"
      within ".preface > h1" do
        page.should have_content("Step #{step.position}: ")
        within "span.subtitle" do
          page.should have_content(step.title)
        end
      end
      page.execute_script("window.editor.getSession().setValue('#{step.solution.gsub("\r", ";").gsub("\n", ";")}')")
      click_on("run this")
      within ".progress .success" do
        page.should have_content(step.success_message.gsub(/<(\W|\w)(\w)+>/, '').gsub(/<a.*/, '').gsub(/&deg;.*/, '').strip)
      end
    end

    click_on("next step >>")
    current_path.should == program_path(Program.last)
    old_user = create(:user, email: "hello@goodbye.com", password: "password")
    visit new_kit_program_path(kit_id: 'puppy')
    click_on "start a new one"
    fill_in "What's it called", with: "my awesome program"
    click_on "Start coding"
    within "#nav" do
      click_on "register"
    end
    page.should have_no_css("#login_form", visible: true)
    page.should have_css("#register_form", visible: true)

    fill_in "name", with: "Sam"
    fill_in "email", with: "hello@goodbye.com"
    fill_in "password", with: "pw"
    fill_in "confirm", with: "notpassword"
    find('#register_form input#user_password_confirmation').native.send_key(:enter)

    within "#register_form .errors" do
      page.should have_content("email has already been taken.")
      page.should have_content("password doesn't match confirmation, is too short (minimum is 6 characters).")
    end

    fill_in "email", with: "hello2@goodbye.com"
    fill_in "password", with: "password"
    fill_in "confirm", with: "password"
    find('#register_form input#user_password_confirmation').native.send_key(:enter)
    page.should have_content("Sam!")

    program = Program.where(name: "my awesome program").first
    user = User.where(email: 'hello2@goodbye.com').first
    program.user.should == user
    click_on "my programs"
    page.should have_content "my awesome program"

    click_on "log out"
    page.should have_no_content("Sam!")

    # Program should not switch users
    visit edit_program_path(program)
    click_on "register"
    page.should have_no_css("#login_form", visible: true)
    page.should have_css("#register_form", visible: true)

    click_on "Already registered? Log in!"
    page.should have_css("#login_form", visible: true)
    page.should have_no_css("#register_form", visible: true)

    within "#login_form" do
      fill_in "email", with: old_user.email
      fill_in "password", with: "password"
      find('input#user_password').native.send_key(:enter)
    end
    page.should have_content("#{old_user.name}!")
    program.reload.user.should == user

  end
end
