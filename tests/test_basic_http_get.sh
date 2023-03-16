#!/bin/bash

function mock_site_visit()
{
  response=$(curl -s -o /dev/null -w "GET" http://localhost/cgi-bin/index.cgi)
  return "$response"
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