#!/bin/bash

function mock_site_visit()
{
  curl -s -o /dev/null -w "%{http_code}" http://localhost:8080
}

function test_site_visit()
{
  if [[ $(mock_site_visit) == "200" ]]; then
    echo "Test passed"
  else
    echo "Test failed"
  fi
}

test_site_visit