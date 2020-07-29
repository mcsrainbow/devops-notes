#!/bin/bash
#
# DevOps notes
# Inspired by https://github.com/liquanzhou/ops_doc
#
# Author: Dong Guo
# Last Modified: 2016/12/22
#

# Exit
exit 0

Categories=(
  Files
  Commands
  Database
  Monitoring
  Network
  Storage
  System
  Cloud
  Clustering
  Uncategorized
)

Files(){
  ls -1                      # list one file per line
  ls -i                      # --inode | print the index number of each file
  ls -lrt                    # sort by modification time and reverse order while sorting

  touch FILE                 # create empty FILE if it does not exist
                             # update the access and modification times of FILE to the current time

  dos2unix FILE              # converts plain text files in DOS format to UNIX format
  unix2dos FILE              # converts plain text files in UNIX format to DOS format

  enca FILE                  # detect and convert encoding of text files

  md5sum FILE                # compute and check MD5 message digest
  cksum FILE                 # checksum and count the bytes in a file

  ln -s SRC_FILE DEST_FILE   # make links between files
  readlink -f DEST_FILE      # print value of a symbolic link

  tail -f FILE               # output appended data as the file grows
  tailf -n 20 FILE           # output the last 20 lines and follow the growth of a log file

  file FILE                  # determine file type

  uniq                       # report or omit repeated lines
  uniq -c                    # --count | prefix lines by the number of occurrences
  uniq -u                    # --unique | only print unique lines

  paste FILE_1 FILE_2        # merge lines of files
  paste -d'+' FILE_1 FILE_2  # reuse characters '+' instead of TABs
  paste -s FILE_1 FILE_2     # paste one file at a time instead of in parallel

  chattr +i FILE             # FILE cannot be modified, deleted or renamed
  chattr +a FILE             # FILE can only be open in append mode for writing

  nl FILE                    # number lines of files

  wc -l                      # print the line counts
  wc -c                      # print the byte counts
  wc -w                      # print the word counts

  cp FILE{,.BAK}             # backup FILE as FILE.BAK
  \cp FILE{,.BAK}            # ignore alias

  rev FILE                   # reverse lines of a file or files
  tac FILE                   # print files in reverse

  comm -12 FILE_1 FILE_2     # print only lines present in both FILE_1 and FILE_2
  comm -3 FILE_1 FILE_2      # print only lines different
  diff FILE_1 FILE_2         # compare files line by line
  diff -y FILE_1 FILE_2      # --side-by-side | output in two columns

  iconv -f gbk -t utf8 GBK_FILE > UTF8_FILE # convert encoding of GBK_FILE from GBK encoding to UTF8

  rename .htm .html *.htm    # rename the extension of html files

  rename FILE FILE0 FILE?  
  rename FILE FILE0 FILE??   # rename FILE1,FILE2,...,FILE278 into FILE001,FILE002,...,FILE278

  sort -n                    # --numeric-sort | sort lines amd compare according to string numerical value
  sort -nr                   # --reverse | reverse the result of comparisons
  sort -n -k 2 -k 3          # --key=POS1[,POS2] | start a key at POS1 (origin 1), end it at POS2 (default end of line)
  sort -k 2n -u              # --unique | remove duplicated lines
  sort -n -t':' -k 3r        # --field-separator | use SEP instead of non-blank to blank transition
  sort -k 1.3                # POS is F[.C][OPTS], where F is the field number and C the character position in the field

  updatedb                   # update a database for mlocate
  locate FILE_NAME           # find files by name

  find . -perm 777                                        # find which permission bits mode is 777
  find . -user dong                                       # find which owned by user "dong"
  find . -group adm                                       # find which owned by group "adm"
  find . -mmin +180                                       # fine which last modified 180 minutes ago
  find . -mtime +30                                       # find which last modified 30 days ago
  find . -mtime +30 -delete                               # find and delete which last modified 30 days ago
  find . -mtime +30 | xargs -n 1 rm -rf                   # find and delete which last modified 30 days ago
  find . -inum 663673 -exec mv {} {}_renamed \;           # find which has inode number 663673 and rename it with suffix "_renamed"
  find . -type f -name 'err*' -exec rename err ERR {} \;  # find which name has "err" and rename the "err" in name as "ERR"
  find . -type f -size +1G                                # find which file size is greater than 1G
  find . -name '*TOM*' -or -name '*JACK*'                 # find expressions with 'or'

  /etc/vimrc                          # global configuration file
  set backupcopy=yes                  # avoid changing the file inode number
  vim -O2 FILE_1 FILE_2               # open 2 windows side by side for FILE_1 and FILE_2
  vim -o2 FILE_1 FILE_2               # open 2 windows stacked for FILE_1 and FILE_2
  CTRL+ww                             # switch between windows
  CTRL+U                              # page up
  CTRL+D                              # page down
  https://github.com/mcsrainbow/vimrc # more practices

  tar xzvpf FILE.tar.gz -C /FOLDER                        # extract all files in FILE.tar.gz to /FOLDER
  tar xzvpf FILE.tar.gz -C /FOLDER FOLDER_IN_FILE         # --directory | extract only FOLDER_IN_FILE to /FOLDER
  tar czf FOLDER.tgz FOLDER                               # compress the FOLDER as FOLDER.tgz
  tar --use-compress-program=pigz -czf FOLDER.tgz FOLDER  # use pigz program to speed up with all cpu vcores
  tar --exclude=/FOLDER/JACK --exclude=*.tgz -czf FOLDER.tgz FOLDER # compress the FOLDER as FOLDER.tgz but exclude /FOLDER/JACK and all "*.tgz" files
  tar tvf FILE.tgz                                        # list archive contents in FILE.tgz to stdout

}
