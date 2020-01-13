#!/usr/bin/env bash
cd "$(dirname "$0")"    # use script's location as working directory

#
# execute first-time setup procedures
#
# example:
#   /> ./setup.sh
#

if [ -e .env ]; then
  echo "Error: file .env already exists"
  exit 1
else

  # create docker .env file
  dir="$(pwd)"
  parentdir="$(dirname "$dir")"
  echo "ROOT_PATH=$parentdir" >> ../.env
  echo "Created .env file"

fi

../mean_enterprise_starter_server/scripts/setup.sh
../mean_enterprise_starter_client/scripts/setup.sh
