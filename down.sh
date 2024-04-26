#!/bin/bash

cd base
docker-compose down || true
cd ..

cd mvp-pool
docker-compose down || true
cd ..