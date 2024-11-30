#!/bin/bash

cd ${PROJECT_DIR}

# swift-format
sleep 2
swift format -r . -i --configuration tools/swift-format-configuration
