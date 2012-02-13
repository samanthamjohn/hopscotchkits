require 'spec_helper'
feature "hopscotch kits flow", js: true do
  background do
    kit = Kit.create!(slug: "puppy")
    step_1 = Step.create!(image_url: "step2.png", success_message: "You passed", title: "I love puppies", description: "hello from step 1", kit: kit, position: 1, spec: "assert(( -> true), 'Step 1 is passed')")
    step_2 = Step.create!(success_message: "Yep", title: "I <3 kitties", description: "in between at step 2", kit: kit, position: 2, spec: "assert(( -> true), 'Step 2 is done')")
    step_3 = Step.create!(success_message: "fuubar", title: "poop", description: "goodbye from step 3", kit: kit, position: 3, spec: "assert(( -> true), 'Step 3 is complete')")
  end

  scenario "completing a kit" do
    visit root_path
    fill_in "What's your name?", with: "Samantha"
    page.execute_script("window.editor.getSession().setValue('makeWorkspace()')")
    click_on("Run this")
    within_frame('stage') do
      Nokogiri::HTML.parse(page.body).css('ellipse')
    end
    click_on "Start coding"

    # step 1
    within ".preface > h1" do
      page.should have_content('Step 1: ')
      within "span.subtitle" do
        page.should have_content("I love puppies")
      end
    end
    page.should have_css("img[src='/assets/step_images/step2.png']")
    page.execute_script("window.editor.getSession().setValue('makeWorkspace()')")
    click_on("run this")
    within_frame('stage') do
      Nokogiri::HTML.parse(page.body).css('svg')
    end
    within ".progress .success" do
      page.should have_content("You passed")
    end

    # step 2
    click_on("Next")
    within ".preface > h1" do
      page.should have_content('Step 2: ')
      within "span.subtitle" do
        page.should have_content("I <3 kitties")
      end
    end
    page.execute_script("window.editor.getSession().setValue('makeWorkspace().ellipse(0,0,10,10)')")
    click_on("run this")
    within_frame('stage') do
      Nokogiri::HTML.parse(page.body).css('ellipse')
    end
    within ".progress .success" do
      page.should have_content("Yep")
    end

    # step 3
    click_on("Next")
    click_on("run this")
    within_frame('stage') do
      Nokogiri::HTML.parse(page.body).css('svg')
    end
    within ".progress .success" do
      page.should have_content("fuubar")
      page.should have_css("a[href='/programs/#{Program.last.id}']")
    end
    within ".progress" do
      page.should have_content("Complete!")
    end
    click_on("Next")
    current_path.should == program_path(Program.last)

  end
end
