require "vagrant"

module VagrantPlugins
  module GuestCoreOS
    class Plugin < Vagrant.plugin("2")
      name "CoreOS guest"
      description "CoreOS guest support."

      guest("coreos", "linux") do
        require File.expand_path("../guest", __FILE__)
        Guest
      end

      guest_capability("coreos", "change_host_name") do
        require_relative "cap/change_host_name"
        Cap::ChangeHostName
      end

      guest_capability("coreos", "configure_networks") do
        require_relative "cap/configure_networks"
        Cap::ConfigureNetworks
      end
    end
  end
end
