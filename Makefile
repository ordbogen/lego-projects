EV3LIBPATH = libs/ev3dev-lang-cpp
OUTPUT_DIR = build

SOURCES = \
	$(EV3LIBPATH)/ev3dev.cpp \
	src/main.cpp \
	src/dummy_motor.cpp \

all: docker deploy

docker: 
	sudo docker run --rm -it -v $(PWD):/guirlande -w /guirlande ev3cc sudo make guirlande

guirlande: $(OUTPUT_DIR)/guirlande

$(OUTPUT_DIR)/guirlande: $(SOURCES)
	mkdir -p $(OUTPUT_DIR)
	arm-linux-gnueabi-g++ -Ilibs/ev3dev-lang-cpp -Iinclude -std=c++11 -pthread -o $(OUTPUT_DIR)/guirlande $(SOURCES)

deploy: guirlande
	scp guirlande robot@lan.ev3-3.ordbogen.com:/home/robot/projects/
