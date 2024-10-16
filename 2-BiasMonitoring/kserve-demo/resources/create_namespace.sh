#!/bin/bash

# Check if project name is provided
if [ -z "$1" ]; then
  echo "Error: PROJECT_NAME is not set."
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

# Create a new OpenShift namespace
echo "Creating OpenShift namespace: $PROJECT_NAME"
oc new-project $PROJECT_NAME

# Set the namespace label
echo "Setting namespace label for: $PROJECT_NAME"
oc label namespace $PROJECT_NAME "modelmesh-enabled=false" --overwrite=true
echo "Namespace $PROJECT_NAME created and labeled successfully."