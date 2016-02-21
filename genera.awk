# genera una entero entre 1 y n+1
function randint(n) {
   	return int(n * rand()) + 1
}
# genera una entero entre 100 y 100+n
function randint100(n) {
   	return int(n * rand()) + 100
}
# genera una cadena de n dígitos
function randid(n){
	a = ""
	for (k=0; k < n; k++) {
	   	a = a int(9 * rand())
	}
	return a
}
BEGIN {
	FS = "|"
	cuantos = 400
	# cuantos veces
	for (i=1; i <= cuantos; i++) {
		# entre 1 y 10 veces
		id = randid(13)
		paginas = randint100(450)
		for (j=1; j <= randint(9); j++){
			ejemplar = j
			print i FS id FS ejemplar FS paginas
		}
	}
exit
}
{
	
}
END   {
}