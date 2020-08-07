#!/usr/bin/env bash

if [[ -d aws || -e awscliv2.zip ]]; then
  echo "Not pulling awscli v2, already exists"
else
  echo "Downloading awscli version 2"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &>/dev/null
  if [[ $? == 0 ]]; then
    echo "Downloaded awscli version 2"
  else
    echo "Error: unable to download awscli"
  fi
fi

if [[ ! -e awscliv2.zip ]]; then
  echo "Error: awscliv2.zip does not exist"
  exit 1
elif [[ -e awscliv2.zip && -d aws ]]; then
  echo "awscli previously decompressed"
else 
  echo "Unzipping awscli version 2"
  unzip awscliv2.zip &>/dev/null
  if [[ $? == 0 ]]; then
    echo "awscli unzipped"
  else
    echo "Error: Unable to unzip awscli"
    exit 1
  fi
fi

echo "Building cdk image"

docker build -t cdk:ubuntu20.04 . &>/dev/null

if [[ $? == 0 ]]; then
  echo "Built and tagged CDK image as 'cdk:ubuntu20.04'"
else
  echo "Error: Unable to build image"
  exit 1
fi
