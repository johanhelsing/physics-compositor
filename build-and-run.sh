#!/bin/bash
mkdir -p build && cd build && qmake .. && make && ./physics-compositor
