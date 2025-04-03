#!/usr/bin/env bash
#
# This script is for local development to help set up the environment so you
# can run updatecli. It checks if the environment variables BITBUCKET_USER,
# BITBUCKET_TOKEN, BITBUCKET_EMAIL, BITBUCKET_NAME, GITHUB_USER and GITHUB_TOKEN are set. If any of these
# variables are not set, the script prompts you to enter them. If a variable is
# already set, the script notifies you and skips prompting.
#
# Usage:
#   source ./setup.env.sh
#

# Prompt for BITBUCKET_USER if not set
if [ -z "${BITBUCKET_USER}" ]; then
  echo -n "Please enter your BITBUCKET_USER: "
  read -r BITBUCKET_USER
else
  echo "BITBUCKET_USER environment variable detected. Not prompting."
fi
echo ""

# Prompt for BITBUCKET_TOKEN if not set
if [ -z "${BITBUCKET_TOKEN}" ]; then
  echo -n "Please enter your BITBUCKET_TOKEN: "
  read -s -r BITBUCKET_TOKEN
else
  echo "BITBUCKET_TOKEN environment variable detected. Not prompting."
fi
echo ""

# Prompt for BITBUCKET_EMAIL if not set
if [ -z "${BITBUCKET_EMAIL}" ]; then
  echo -n "Please enter your BITBUCKET_EMAIL (e.g. jane.doe@acme.com): "
  read -r BITBUCKET_EMAIL
else
  echo "BITBUCKET_EMAIL environment variable detected. Not prompting."
fi
echo ""

# Prompt for BITBUCKET_NAME if not set
if [ -z "${BITBUCKET_NAME}" ]; then
  echo -n "Please enter your BITBUCKET_NAME (e.g. 'Jane Doe'): "
  read -r BITBUCKET_NAME
else
  echo "BITBUCKET_NAME environment variable detected. Not prompting."
fi
echo ""

# Prompt for GITHUB_USER if not set
if [ -z "${GITHUB_USER}" ]; then
  echo -n "Please enter your GITHUB_USER: "
  read -r GITHUB_USER
else
  echo "GITHUB_USER environment variable detected. Not prompting."
fi
echo ""

# Prompt for GITHUB_TOKEN if not set
if [ -z "${GITHUB_TOKEN}" ]; then
  echo -n "Please enter your GITHUB_TOKEN: "
  read -s -r GITHUB_TOKEN
else
  echo "GITHUB_TOKEN environment variable detected. Not prompting."
fi
echo ""

# Export the variables
export BITBUCKET_USER
export BITBUCKET_TOKEN
export BITBUCKET_EMAIL
export BITBUCKET_NAME
export GITHUB_USER
export GITHUB_TOKEN

echo "Environment variables set!"
