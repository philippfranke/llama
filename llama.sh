#!/bin/bash

# llama 0.1 - Converting with joy

# Convert mysql database from latin1 to utf8 properly based on Sarim Khan's
# blog post Mysql Utf/latin Collation and Bangla Nightmare

# The MIT License (MIT)

# Copyright (c) 2013 Philipp Franke <dev@philippfranke.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Special thanks to Sarim Khan <http://bit.ly/16ZrHgV>.

echo "### llama 0.1 ###"
echo "llama converts mysql database from latin1 to utf8"
echo

echo "Please enter username: "
read username

echo "Please enter $username passwd: "
read -s passwd

echo "Please enter database: "
read database

echo "Fetching $database"
cd /tmp
mysqldump -u $username -p$passwd $database > /tmp/database.sql

sed -i -e's/CHARSET=utf8 COLLATE=utf8_unicode_ci/CHARSET=latin1/g' /tmp/database.sql
sed -i -e's/COLLATE utf8_unicode_ci/COLLATE latin1_bin/g' /tmp/database.sql

echo "Importing fixed mysql dump"
mysql -u $username -p$passwd $database < /tmp/database.sql

rm -f /tmp/database.sql

echo "Fetching mysqldump again"
mysqldump --default-character-set=latin1 -u $username -p$passwd $database > /tmp/database_latin.sql

sed -i -e's/SET NAMES latin1/SET NAMES utf8/g' /tmp/database_latin.sql
sed -i -e's/CHARSET=latin1/CHARSET=utf8 COLLATE=utf8_unicode_ci/g' /tmp/database_latin.sql
sed -i -e's/COLLATE latin1_bin/COLLATE utf8_unicode_ci/g' /tmp/database_latin.sql
sed -i -e's/CHARACTER SET latin1/CHARACTER SET utf8/g' /tmp/database_latin.sql

echo "Importing fixed mysql dump again"
mysql -f --default-character-set=utf8 -u $username -p$passwd $database < /tmp/database_latin.sql

#rm -f /tmp/database_latin.sql Not save if error appear

echo "!!!Please delete /tmp/database_latin.sql!!!"

echo "### I'm done here ###"
