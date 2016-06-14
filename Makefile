CC=gcc
BIN=bin
CFLAGS=-c -pedantic -O2 -Wall -Wextra -std=c11 $(INCLUDE)
LDFLAGS=-std=c11
SOURCES=$(wildcard includes/*.c) blockcipher32.c 
OBJECTS=$(addprefix $(BIN)/, $(notdir $(SOURCES:.c=.o)))
EXECUTABLE=$(BIN)/main
vpath %.c includes

all: $(EXECUTABLE)

$(BIN):
	mkdir -p $(BIN)

$(EXECUTABLE): $(BIN) $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

-include $(BIN)/$(OBJECTS:.o=.d)

$(BIN)/%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $(BIN)/$*.o
	$(CC) -MM $(CFLAGS) $< > $(BIN)/$*.d 
	@mv -f $(BIN)/$*.d $(BIN)/$*.d.tmp
	@sed -e 's|.*:|$(BIN)/$*.o:|' < $(BIN)/$*.d.tmp > $(BIN)/$*.d
	@sed -e 's/.*://' -e 's/\\$$//' < $(BIN)/$*.d.tmp | fmt -1 | \
	sed -e 's/^ *//' -e 's/$$/:/' >> $(BIN)/$*.d
	@rm -f $(BIN)/$*.d.tmp

clean:
	rm -f $(BIN)/*.o $(BIN)/*.d $(EXECUTABLE)
