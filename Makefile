CC=avr-gcc 
CFLAGS=-Os -DF_CPU=16000000UL -mmcu=atmega328p -nostartfiles -ffreestanding -fbuiltin
LD=avr-gcc 
LDFLAGS=-mmcu=atmega328p

blink.hex : blink
	avr-objcopy -O ihex -R .eeprom $^ $@

blink : blink.c

clean : ; rm -f blink blink.hex
