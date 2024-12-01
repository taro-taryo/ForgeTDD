#!/bin/bash

cd ${PROJECT_DIR}

# プレーンテキストに書き出し
tools/project_source_compression/project_plane_text.sh  \
  --keep-comments \
  -s ForgeTDD \
  -o tools/project_source_compression/plane/all.txt \
  -t tools/project_source_compression/tmp_swift_source \
  -c tools/project_source_compression/swift-format-configuration-compact
