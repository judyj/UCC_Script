#!/bin.bash
#  sloc_setup.sh
# set directory names
OLD_DIR=/home/judy/compare/simp6_feb_baseline/
NEW_DIR=/home/judy/compare/sloc_0422/
UCC_DIR=/home/judy/ucc/
#
# create the directory for the new pull
mkdir $NEW_DIR
cd $NEW_DIR
# get simp-core and check out stuff there
git clone https://github.com/simp/simp-core.git
cd simp-core
bundle
rake deps:checkout
# now get the ruby directories one at a time
cd ..
mkdir rubies
cd rubies
git clone https://github.com/simp/rubygem-simp-rake-helpers.git
cd rubygem-simp-rake-helpers
bundle
cd ..
git clone https://github.com/simp/rubygem-simp-rspec-puppet-facts.git
cd rubygem-simp-rspec-puppet-facts
bundle
cd ..
git clone https://github.com/simp/rubygem-simp-beaker-helpers.git
cd rubygem-simp-beaker-helpers
bundle
cd ..
git clone https://github.com/simp/rubygem-simp-spec-helpers.git
cd rubygem-simp-spec-helpers
bundle
cd ..
git clone https://github.com/simp/rubygem-simp-processgraph.git
cd rubygem-simp-processgraph
bundle
cd ..
git clone https://github.com/simp/rubygem-simp-build-helpers.git
cd rubygem-simp-build-helpers
bundle
cd ..
git clone https://github.com/simp/rubygem-simp-module-repoclosure.git
cd rubygem-simp-module-repoclosure
bundle
cd ..
git clone https://github.com/simp/rubygem-simp-release-tools.git
cd rubygem-simp-release-tools
bundle
cd ..
# back to starting point
cd ..
UCC -extfile $UCC_DIR/typefile2 -unified -nocomplex -d -dir $OLD_DIR/rubies $NEW_DIR/rubies -outdir ../diffslocdaterubies
UCC -extfile $UCC_DIR/typefile2 -unified -nocomplex -d -dir $OLD_DIR/simp-core $NEW_DIR/simp-core -outdir ../diffslocdatecore
# the data you need will be in 
# ../diffslocdatecore/outfile_diff_results.csv
# ../diffslocdaterubies/outfile_diff_results.csv
