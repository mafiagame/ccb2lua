pyinstaller ./ccb2lua.py -F --distpath .

rm -rf build

rm -rf *.spec

rm -rf *.pyc


target=../../../client/proj.ccb/ccb2lua

mkdir $target

cp *.lua $target

cp ccb2lua $target

rm -rf ccb2lua