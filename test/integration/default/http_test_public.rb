#!/usr/bin/env ruby

public_dns = attribute(
  "public_dns",
  description: "public dns"
)

describe http("http://#{public_dns[0]}:4200") do
    its('status') { should cmp 200 }
end
