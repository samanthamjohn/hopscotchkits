require 'spec_helper'
feature "hopscotch kits flow", js: true do
  background do
    require File.expand_path(Rails.root.join("db/seeds.rb"), __FILE__)
  end
  scenario "completing a kit" do
    steps = Kit.find_by_slug("puppy").steps.order("position ASC").all
    visit root_path
    fill_in "What's your name?", with: "Samantha"
    click_on "Start coding"

    # step 1
    within ".preface > h1" do
      page.should have_content('Step 1: ')
      within "span.subtitle" do
        page.should have_content(steps[0].title)
      end
    end
    click_on("more info")
    within "#more_info" do
      page.should have_content(steps[0].more_info.split('. ').last)
    end
    click_on("less info")
    page.should have_css("#more_info", visible: false)

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
    click_on("Next")
    within ".preface > h1" do
      page.should have_content('Step 2: ')
      within "span.subtitle" do
        page.should have_content(steps[1].title)
      end
    end
    page.should have_css("img[src='/assets/step_images/#{steps[1].image_url}']")
    page.should have_no_css("#more_info")

    page.execute_script("window.editor.getSession().setValue('#{steps[1].solution.gsub("\r", ";").gsub("\n", ";")}')")
    click_on("run this")
    within ".progress .success" do
      page.should have_content(steps[1].success_message.gsub(/<(\W|\w)(\w)+>/, '').strip)
    end

    steps[2, (steps.length - 3)].each do |step|
      click_on "Next"
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

    click_on("Next")
    current_path.should == program_path(Program.last)

  end
end
