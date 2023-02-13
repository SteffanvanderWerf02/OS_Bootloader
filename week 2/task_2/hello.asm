use16 ; tell fasm this is 16 bit code
org 0x7c00 ; tell fasm to start outputting stuff at offset 0x7c00

boot:
    mov si, introText ; point si register to introText
    mov ah, 0x0e; write character to TTY 

.loop:
    lodsb ; iterate over the si register everytime once, untill the null byte has been reached
    or al,al ; is al == 0 ?
    jz userInput  ; if (al == 0) jump to userinput
    int 10h ; run bios interrupt 10h (used in combination with 0x0e to write to TTY)
    jmp .loop
    
userInput:
    mov ah,00h ; set to mode 00h (user input)
    int 16h ; use interrupt 16h (user input)

    cmp al, 51 ; if ascii equivalent 3 is pressed, continue
    mov si, peanutButter ; rewrite si register
    je printHalt ; jump if user input equals 3, print it

    cmp al, 50 ; equivalent of 2
    mov si, chicken
    je printHalt

    cmp al, 49 ; equivalent of 1
    mov si, burrito
    je printHalt
    
    jmp userInput ; iterate over the loop again

printHalt:
    mov ah, 0x0e
    .loop:
        lodsb
        or al,al ; is al == 0 ?
        jz halt  ; if (al == 0) jump to halt label
        int 0x10 ; runs BIOS interrupt 0x10 - Video Services
        jmp .loop

burrito:
    db "Your favourite food is burrito",0
chicken:
    db "Your favourite food is chicken",0
peanutButter:
    db "Your favourite food is peanutButter",0

halt:
    cli ; clear interrupt flag
    hlt ; halt execution

introText:
    db "What is your favourite food?",13,10
    db "1 for burritos",13,10
    db "2 for chicken",13,10
    db "3 for peanutButter",13,10
    db "", 13,10,0


times 510 - ($-$$) db 0 ; pad remaining 510 bytes with zeroes
dw 0xaa55 ; magic bootloader magic - marks this 512 byte sector bootable!