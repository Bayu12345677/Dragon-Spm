key = ""

build:
  @echo [!] built package
  apt-get install jq curl wget ossp-uuid wget clang

setup:
  build
  gcc main.c main
  ./main
  
key:
  @echo (key)

author:
  @echo whatsapp: 085731184377
