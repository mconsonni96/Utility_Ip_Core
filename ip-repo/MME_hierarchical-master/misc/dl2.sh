#!/bin/bash

echo "specify the destination folder"
read name
cd "$name"
git clone git@bitbucket.org:TimeEngineers/axi4-stream-multicobs-upsizer.git

git clone git@bitbucket.org:TimeEngineers/axi4-stream-datamover-s2mm.git
cd axi4-stream-datamover-s2mm
git checkout v2.0
cd ../

git clone git@bitbucket.org:TimeEngineers/axi4-stream-datamover-mm2s.git
cd axi4-stream-datamover-mm2s
git checkout v2.0
cd ../

git clone git@bitbucket.org:TimeEngineers/axi4-stream-packetfetcher.git

git clone git@bitbucket.org:TimeEngineers/axi4-stream-packetizer.git
