CC=avr-gcc 
CFLAGS=-Wall -Wextra -Os -DF_CPU=16000000UL -mmcu=atmega328 -nostartfiles -ffreestanding -fbuiltin

blink.hex : blink
	avr-objcopy -O ihex -R .eeprom $^ $@

blink : blink.c

# This is for Linux, where my Pololu programmer is registered as /dev/ttyACM0
flash : blink.hex
	avrdude -p m328 -c avrisp2 -P /dev/ttyACM0 -v -U flash:w:$^

clean : ; rm -f blink blink.hex
