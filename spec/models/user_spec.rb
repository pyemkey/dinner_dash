require 'spec_helper'

describe User do
  it { should ensure_length_of(:display_name).is_at_least(2).is_at_most(32) }
end
