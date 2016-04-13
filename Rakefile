# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  require 'rubygems'
  require 'motion-cocoapods'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'MyApp'
  app.deployment_target = '9.3'
  app.frameworks += ['MapKit','CoreLocation','ContactsUI']
  app.info_plist['NSLocationAlwaysUsageDescription'] = 'Example app needs your location just because.'
  app.info_plist['NSLocationWhenInUseUsageDescription'] = 'Example app needs your location just because.'
  app.pods do
    pod 'AFNetworking'
  end
end
