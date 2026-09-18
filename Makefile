GNAT:=gnatmake
FLAGS:=-gnatwa -gnat2022
.PHONY: all test clean
all:
	mkdir -p obj bin
	$(GNAT) $(FLAGS) -Pinterfaces_c_pointers_topic.gpr
test: all
	@bin/tests
clean:
	rm -rf obj bin
