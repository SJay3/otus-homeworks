#!/bin/bash
set -e

# Run InSpec
inspec exec linting/tests
