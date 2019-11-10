HC=/Users/elena/.ghcup/ghc/8.6.5/bin/ghc
#HC=ghc
SOURCES=src/Main.hs src/Grammar.hs
GEN_SOURCES=src/Lexer.x src/Parser.y
GENERATED=src/Lexer.hs src/Parser.hs
PACKAGE=hw0.zip

.PHONY: pack all run clean

all: parser

run: parser
	./parser

clean:
	rm -rf src/*.o src/*.hi
	rm -rf $(GENERATED)
	rm -f parser

parser: $(GENERATED) $(SOURCES)
	$(HC) -i./src -tmpdir . ./src/Main.hs -o parser

$(GENERATED): $(GEN_SOURCES) $(SOURCES)
	/Users/elena/.local/bin/alex src/Lexer.x -o src/Lexer.hs
	/Users/elena/.local/bin/happy src/Parser.y -o src/Parser.hs

pack: $(GENERATED)
	zip $(PACKAGE) -r Makefile src
