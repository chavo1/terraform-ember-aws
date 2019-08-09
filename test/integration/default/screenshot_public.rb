#!/usr/bin/env ruby

public_dns = attribute(
  "public_dns",
  description: "public dns"
)

require 'rubygems'
require 'selenium-webdriver'
require 'fileutils'

FileUtils.mkdir_p 'scr/'

browser = Selenium::WebDriver.for :firefox 
browser.get "http://#{public_dns[0]}:4200" 
  sleep 3  
browser.save_screenshot("scr/screen.png")
browser.quit

