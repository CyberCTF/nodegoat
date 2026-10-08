#!/bin/sh
# user1 / User1_123 logs in (redirected to the dashboard), which proves the database was reset
# with NodeGoat's seed users.
curl -sS -o /dev/null -w '%{redirect_url}' --data "userName=user1&password=User1_123" http://web:4000/login |
  grep -q "/dashboard"
