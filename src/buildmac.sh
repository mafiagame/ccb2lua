pyinstaller ./ccb2lua.py -F --distpath .

rm -rf build

rm -rf *.spec

rm -rf *.pyc

mkdir mac

cp *.lua ./mac

cp ccb2lua mac/

rm -rf ccb2lua