#!/bin/bash

#http://localhost/cgi-bin/index.cgi

function mock_site_visit()
{
  # get the private non loop back IPv4 address of the host machine
  #ip=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
  #ip=$(curl ifconfig.me > /dev/null)
  #echo "IP: $ip"
  curl -s -o /dev/null -w "%{http_code}" http://localhost/cgi-bin/index.cgi
}

function test_site_visit()
{
  response=$(mock_site_visit)
  if [[ $response == "200" ]]; then
    echo "Test passed"
  else
    echo "Test failed with response: $response"
  fi
}

test_site_visit