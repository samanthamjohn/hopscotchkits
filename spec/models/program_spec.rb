require 'spec_helper'

describe Program do
  it { should belong_to :kit }
  it { should belong_to :current_step }
  it { should belong_to :user }
  it { should validate_presence_of :user }

  describe "creation" do
    it "should start on the first step" do
      kit = Kit.create!(slug: "foo")
      step = Step.create!(position: 1, kit: kit)
      user = User.create!(name: "foo")
      p = Program.create!(kit: kit, user: user)
      p.current_step.should == step
    end
  end

  describe "#next_step" do
    it "should return the next step" do
      kit = Kit.create!(slug: "foo")
      step = Step.create!(position: 1, kit: kit)
      next_step = Step.create!(position: 5, kit: kit)
      user = User.create!(name: "foo")
      p = Program.create!(kit: kit, user: user)
      p.next_step.should == next_step
    end
  end

  it "should set to_param to the user's slug" do
    p = Program.new(user: User.new(slug: "slug"))
    p.to_param.should == "slug"
  end
end
