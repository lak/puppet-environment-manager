#!/usr/bin/env rspec
require 'spec_helper'

require 'puppet/application/environment'

describe Puppet::Application::Environment do
  it "should be a subclass of FaceBase" do
    Puppet::Application::Environment.ancestors.should include(Puppet::Application::FaceBase)
  end
end
