#!/bin/bash

# Check if project name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

# Create a new OpenShift namespace
oc new-project $PROJECT_NAME

# Set the namespace label
oc label namespace $PROJECT_NAME "modelmesh-enabled=false" --overwrite=true