key = ""

build:
  @echo [!] built package
  apt-get install jq curl wget ossp-uuid wget clang

.:
  build
  cmake -DCMAKE_BUILD_TYPE=Debug
  ./main
  
key:
  @echo (key)

author:
  @echo whatsapp: 085731184377
