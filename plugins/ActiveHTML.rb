##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ActiveHTML" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "seliSoft ActiveHTML provides Active-Server-Pages (ASP) to nearly every web server supporting CGI. - Homepage: http://www.selisoft.com/en/ahtml/"

# ShodanHQ results as at 2011-08-06 #
# 65 for ActiveHTML

# Examples #
examples %w|
211.22.178.47
213.13.123.56
85.47.141.73
82.85.116.118
207.250.0.196
81.149.7.77
|

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /ActiveHTML\/([^\s]+)/
		m << { :version=>"#{$1}" }
	end

	# Version Detection # X-Powered-By
	if @headers["x-powered-by"] =~ /seliSoft ActiveHTML\/([^\s]+)/
		m << { :version=>"#{$1}" }
	end

	# Return passive matches
	m
end
end

