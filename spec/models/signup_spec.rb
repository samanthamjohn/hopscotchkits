require 'spec_helper'
describe Signup do
  it { should validate_presence_of :email}
  it { should validate_presence_of :source}
end
