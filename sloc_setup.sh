#!/bin.bash
#  sloc_setup.sh
#
# create the directory for the new pull
mkdir sloc_0501
cd sloc_0501
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
git clone https://github.com/simp/rubygem-simp-rspec-puppet-facts
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
cd rubygem-simp-beaker-helpers
bundle
cd ..
git clone https://github.com/simp/rubygem-simp-module-repoclosure.git
cd rubygem-simp-beaker-helpers
bundle
cd ..
git clone https://github.com/simp/rubygem-simp-release-tools.git
cd rubygem-simp-release-tools
bundle
cd ..
# back to starting point
cd ..
UCC -extfile /var/jjohnson/UCC/ucc_2015.12/typefile2 -unified -nocomplex -d -dir /var/jjohnson/sloc_0401/rubies /var/jjohnson/sloc_0501/rubies -outdir ../diffsloc0501rubies
UCC -extfile /var/jjohnson/UCC/ucc_2015.12/typefile2 -unified -nocomplex -d -dir outfile_diff_results.csv/var/jjohnson/sloc_0401/simp-core /var/jjohnson/sloc_0501/simp-core -outdir ../diffsloc0501core
# the data you need will be in 
# ../diffsloc0401core/outfile_diff_results.csv
# ../diffsloc0501rubies/outfile_diff_results.csv
