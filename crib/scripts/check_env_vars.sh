#!/usr/bin/env bash

# List of required environment variables
required_vars=(
  "DEVSPACE_IMAGE"
  "DEVSPACE_INGRESS_CIDRS"
  "DEVSPACE_INGRESS_BASE_DOMAIN"
  "DEVSPACE_INGRESS_CERT_ARN"
  "DEVSPACE_K8S_POD_WAIT_TIMEOUT"
  "CCIP_HELM_CHART_URI"
  "NS_TTL"
  "DEVSPACE_CCIP_SCRIPTS_IMAGE"
  "DEVSPACE_CCIP_SCRIPTS_OIDC_ROLE_ARN"
  "DEVSPACE_CCIP_SCRIPTS_OUTPUT_BUCKET_NAME"
  )

missing_vars=0  # Counter for missing variables

# Check each variable
for var in "${required_vars[@]}"; do
  if [ -z "${!var}" ]; then  # If variable is unset or empty
    echo "Error: Environment variable $var is not set."
    missing_vars=$((missing_vars + 1))
  fi
done

# Exit with an error if any variables were missing
if [ $missing_vars -ne 0 ]; then
  echo "Total missing environment variables: $missing_vars"
  echo "To fix it, add missing variables in the \"crib/.env\" file."
  echo "you can find example of the .env config in the \"crib/.env.example\""
  exit 1
else
  echo "All required environment variables are set."
fi
