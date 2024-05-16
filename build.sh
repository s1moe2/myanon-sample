#!/bin/bash

git clone --depth 1 --branch v0.5 https://github.com/ppomes/myanon.git

docker build --tag myanon ./myanon

docker build --tag sample-anon -f anon.Dockerfile .

rm -rf myanon