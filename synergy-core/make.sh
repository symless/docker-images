cd /root/synergy-core
mkdir -p build/$1
cd build/$1
if [[ -z $(which cmake) ]]
then
  cmake3 ../.. | tee cd build/cmake_${1}.log
else
  cmake ../.. | tee cd build/cmake_${1}.log
fi
make  | tee cd build/make_${1}.log