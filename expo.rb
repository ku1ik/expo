require 'rainbow'
%w(expo directory album category photo style).each { |f| require "lib/#{f}" } 