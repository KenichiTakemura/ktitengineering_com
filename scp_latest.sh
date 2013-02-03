target=`ls -1tr release | tail -1`
scp -p release/$target koolbzco@koolbz.com.au:ktitengineering/.
