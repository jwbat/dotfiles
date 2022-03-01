all: project

project:  main.o source.o
	g++ -std=c++20 main.o source.o -o m

main.o:  main.cpp
	g++ -std=c++20 -c main.cpp

source.o:  source.cpp
	g++ -std=c++20 -c source.cpp

clean:
	rm *.o
