#!/usr/bin/env bash

docker run -it --rm -v ~/.aws/:/root/.aws/ cdk:ubuntu20.04 /bin/bash
