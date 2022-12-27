BIN := string_ipa_sra
all : $(BIN)


string_ipa_sra : string_ipa_sra.cpp
	g++ $< -O2  -o $@ -g3 -no-pie
	nm -aDC $@ | egrep "M_construct|basic_string"
	g++ $< -O2  -o $@ -fno-ipa-sra -g3 -no-pie
	nm -aDC $@ | egrep "M_construct|basic_string"

clean :
	rm $(BIN)
