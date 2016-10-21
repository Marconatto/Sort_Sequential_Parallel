#!/usr/bin/env bash
#-----------------------------------------------------#

#  Arquivo:       executa.bash

#  Descricao:     Execução dos codigos do TCC
#				"Analise de desempenho e maturidade da biblioteca OpenMP"

#  Autor:         Marco Antonio Marconatto

#  Auxiliar:  http://www.devmedia.com.br/introducao-ao-shell-script-no-linux/25778

#----------------------------------------------------#
script log_saidas
	 echo "Iniciando testes!"
	 # ------------------declarando locais do quick sort
	 locaisparaljav[0]="Quick-Sort/Quick_paralelo.java"
	 locaissequejav[0]="Quick-Sort/Quick_sequencial.java"
	 locaisparalcpp[0]="Quick-Sort/Quick-paralelo.cpp"
	 locaissequecpp[0]="Quick-Sort/Quick-sequencial.cpp"
	 # ------------------declarando locais do radix sort
	 locaisparaljav[1]="Radix-Sort/Radix_paralelo.java"
	 locaissequejav[1]="Radix-Sort/Radix_sequencial.java"
	 locaisparalcpp[1]="Radix-Sort/Radix-paralelo.cpp"
	 locaissequecpp[1]="Radix-Sort/Radix-sequencial.cpp"
	 # ------------------declarando locais do odd-even
	 locaisparaljav[2]="Odd-Even/odd_even_paralelo.java"
	 locaissequejav[2]="Odd-Even/odd_even_sequencial.java"
	 locaisparalcpp[2]="Odd-Even/odd-even-paralelo.cpp"
	 locaissequecpp[2]="Odd-Even/odd-even-sequencial.cpp"
	 # ------------------declarando locais do Merge-Sort
	 locaisparaljav[3]="Merge-Sort/merge_paralelo.java"
	 locaissequejav[3]="Merge-Sort/merge_sequencial.java"
	 locaisparalcpp[3]="Merge-Sort/merge-paralelo.cpp"
	 locaissequecpp[3]="Merge-Sort/merge-sequencial.cpp"
	 # ------------------declarando locais do Bitonic-Sort
	 locaisparaljav[4]="Bitonic-Sort/bitonic_paralelo.java"
	 locaissequejav[4]="Bitonic-Sort/bitonic_sequencial.java"
	 locaisparalcpp[4]="Bitonic-Sort/bitonic-paralelo.cpp"
	 locaissequecpp[4]="Bitonic-Sort/bitonic-sequencial.cpp"
	 # ------------------------------------------------------------------------
	 for i in {10..0};
	 do
		echo "Repetição $i de 10 !"
		for j in {5..0};
		do
			case $j in
			"0")
				echo "Execução Quick Sort"
				;;
			"1")
				echo "Execução Radix Sort"
				;;
			"2")
				echo "Execução Odd-Even Sort"
				;;
			"3")
				echo "Execução Merge Sort"
				;;
			"4")
				echo "Execução Bitonic Sort"
				;;
			esac
		echo "--Execução java sequencial"
		javac ${locaissequejav[$j]}
		java ${locaissequejav[$j]}
		echo "--Execução java paralelo"
		omp4j ${locaisparaljav[$j]}
		echo "--Execução C++ sequencial"
		g++ ${locaissequecpp[$j]} -o saidaseqcpp
		echo "--Execução C++ paralelo"
		g++ -fopenmp ${locaisparalcpp[$j]} -o saidaparcpp
		done
	done
exit
