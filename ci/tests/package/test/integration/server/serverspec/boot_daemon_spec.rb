require 'serverspec'
require_relative 'spec_helper.rb'

# Required by serverspec
set :backend, :exec

describe "Spring Boot Daemon" do

  context "service" do
    subject {service('daemon-demo.service')}

    it "is enabled" do
      expect(subject).to be_enabled
    end

    it "is running" do
      expect(subject).to be_running
    end
  end

  context "http connection" do
    subject {command('curl http://localhost:8080')}

    it "is listening", :retry => 3, :retry_wait => 10 do
      expect(subject.exit_status).to eq 0
    end

  end

end