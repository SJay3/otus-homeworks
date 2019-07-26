#!/bin/bash
set -e

#Create keys
touch ~/.ssh/appuser.pub ~/.ssh/appuser

# Run InSpec
inspec exec linting/tests
