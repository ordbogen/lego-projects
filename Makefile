EV3LIBPATH = libs/ev3dev-lang-cpp

all: docker deploy

docker: 
	sudo docker run --rm -it -v $(PWD):/guirlande -w /guirlande ev3cc sudo make guirlande

guirlande: build/guirlande

build/guirlande: src/main.cpp src/dummy_motor.cpp $(EV3LIBPATH)/ev3dev.cpp	
	arm-linux-gnueabi-g++ -Ilibs/ev3dev-lang-cpp -Iinclude -std=c++11 -pthread -o build/slice src/main.cpp src/dummy_motor.cpp $(EV3LIBPATH)/ev3dev.cpp

deploy: guirlande
	scp slice robot@lan.ev3-3.ordbogen.com:/home/robot/projects/
