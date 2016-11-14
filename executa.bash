#!/bin/bash
#-----------------------------------------------------#
#  Arquivo:       executa.bash
#  Descricao:     Execução dos codigos do TCC
#				Analise de desempenho e maturidade da biblioteca OpenMP
#  Autor:         Marco Antonio Marconatto
#  Auxiliar:  http://www.devmedia.com.br/introducao-ao-shell-script-no-linux/25778
#----------------------------------------------------#
echo "Iniciando testes!"
# ------------------declarando locais do quick sort
locaisparaljav[0]="Quick_paralelo"
locaissequejav[0]="Quick_sequencial"
locaisparalcpp[0]="Quick-paralelo.cpp"
locaissequecpp[0]="Quick-sequencial.cpp"
# ------------------declarando locais do radix sort
locaisparaljav[1]="Radix_paralelo"
locaissequejav[1]="Radix_sequencial"
locaisparalcpp[1]="Radix-paralelo.cpp"
locaissequecpp[1]="Radix-sequencial.cpp"
# ------------------declarando locais do odd-even
locaisparaljav[2]="odd_even_paralelo"
locaissequejav[2]="odd_even_sequencial"
locaisparalcpp[2]="odd-even-paralelo.cpp"
locaissequecpp[2]="odd-even-sequencial.cpp"
# ------------------declarando locais do Merge-Sort
locaisparaljav[3]="merge_paralelo"
locaissequejav[3]="merge_sequencial"
locaisparalcpp[3]="merge-paralelo.cpp"
locaissequecpp[3]="merge-sequencial.cpp"
# ------------------declarando locais do Bitonic-Sort
locaisparaljav[4]="bitonic_paralelo"
locaissequejav[4]="bitonic_sequencial"
locaisparalcpp[4]="bitonic-paralelo.cpp"
locaissequecpp[4]="bitonic-sequencial.cpp"
# ------------------------------------------------------------------------
for i in 1 2 3 4 5 6 7 8 9 10
do
	echo 
	echo "-------------------------Repeticao $i de 10 -----------------------------------------------"
	for j in 0 1 2 3 4
	do
		case $j in
		"0")
			echo
			echo "Execucao Quick Sort"
			cd Quick-Sort/
			;;
		"1")
			echo
			echo "Execucao Radix Sort"
			cd Radix-Sort/
			;;
		"2")
			echo
			echo "Execucao Odd-Even Sort"
			cd Odd-Even/
			;;
		"3")
			echo
			echo "Execucao Merge Sort"
			cd Merge-Sort/
			;;
		"4")
			echo
			echo "Execucao Bitonic Sort"
			cd Bitonic-Sort/
			;;
		esac
	echo
	echo "--Execucao java sequencial"
	javac "${locaissequejav[$j]}.java" ; time java "${locaissequejav[$j]}" | tee -a logtempo.log
	echo
	echo "--Execucao java paralelo"
	java -jar /home/marconatto/OMP4J/omp4j-1.2.jar "${locaisparaljav[$j]}.java" ; time java "${locaisparaljav[$j]}" | tee -a logtempo.log
	echo		
	echo "--Execucao C++ sequencial"
	g++ "${locaissequecpp[$j]}" -o saidaseqcpp ; time ./saidaseqcpp | tee -a logtempo.log
	echo		
	echo "--Execucao C++ paralelo"
	g++ -fopenmp "${locaisparalcpp[$j]}" -o saidaparcpp ; time ./saidaparcpp | tee -a logtempo.log
	rm -r org
	rm -r saidaseqcpp
	rm -r saidaparcpp
	rm *.class
	cd ..
	done
done
exit
