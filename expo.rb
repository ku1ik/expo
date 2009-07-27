require 'rainbow'
%w(entity home expo album category photo style).each { |f| require "lib/#{f}" } 