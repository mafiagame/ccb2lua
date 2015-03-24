pyinstaller ./ccb2lua.py -F --distpath .

rm -rf build

rm -rf *.spec

rm -rf *.pyc

cp ccb2lua ../bin/ccb2lua

rm -rf ./ccb2lua

