require 'spec_helper'

describe Snapshot do
  it { should belong_to :program }
  it { should belong_to :step }
end
