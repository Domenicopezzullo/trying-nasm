nasm -O3 -felf64 main.s 
ld -o main main.o
rm main.o
