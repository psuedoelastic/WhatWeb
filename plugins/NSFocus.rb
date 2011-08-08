##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NSFocus" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-10
version "0.1"
description "NSFOCUS Web Application Firewall - Homepage: http://www.nsfocus.com/"
# Manual: http://www.nsfocus.com/jp/3_products/090714WAF.pdf

# ShodanHQ results as at 2011-03-13 #
# 25 for nsfocus # All results are from China

# Examples #
examples %w|
113.105.246.47
222.184.79.43
61.178.81.25
202.104.151.72
202.200.112.31
61.55.135.117
202.97.181.12
222.184.59.55
|

# Matches #
matches [

# Default Page
{ :md5=>"4a6a68c719d64f1dd153a94122287f54" },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^NSFocus\/([^\s]+) \( NSFOCUS \)/) } if @headers["server"] =~ /^NSFocus\/([^\s]+) \( NSFOCUS \)/

	# Return passive matches
	m
end

end

