key = "https://carapedi.id/bP5jd06"

build:
		@echo [!] built package
		apt-get install jq curl wget ossp-uuid wget python clang

setup:	build
		gcc main.c -o main
		./main
  
key:
		@echo $(key)

author:
		@echo "whatsapp: 085731184377"
