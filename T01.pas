Program Pzim;  

// Programa para calculo de dias, meses e anos vividos por uma pessoa relativo a data atual

var diaat,mesat,anoat,diana,mesna,anona,difdia,difmes,difano,mesant:integer;   // dia, mes, ano atual & dia, mes, ano nascimento & diferenca dia, mes, ano & mes anterior

Begin
  
  write('Insira o dia de hoje '); read(diaAt);                  
  write('Insira o mês atual ')  ; read(mesAt);                  
  write('Insira o ano atual ')  ; read(anoAt);                  
  write('Insira o dia do seu nascimento '); read(diaNa);        
  write('Insira o mês do seu nascimento '); read(mesNa);        
  write('Insira o ano do seu nascimento '); read(anoNa);        
  
  difDia:=diaAt-diaNa;    // calculo de diferencas   
  difMes:=mesAt-mesNa;       
  difAno:=anoAt-anoNa;      
  
    if (difDia<0) then    // determina o numero de dias do mes anterior caso a diferenca seja negativa
    begin
      mesAnt:=mesAt-1;            
      if ((mesAnt=4) or (mesAnt=6) or (mesAnt=9) or (mesAnt=11)) then
      begin
        difDia:=difDia+30;
        difMes:=difMes-1
      end
      else
      if (mesAnt=2) then
      begin
        difDia:=difDia+28;
        difMes:=difMes-1;
      end
      else
      
      begin
        difDia:=difDia+31;
        difMes:=difMes-1;
      end;
    end
    else
  
  if (difMes<0) then
  begin
    difAno:=difAno-1;
    difMes:=difMes+12;
  end;
  
  writeln( difAno:2,' anos ' ,difMes:2, ' meses ' ,difDia:2, ' dias de vida');
  writeln('Enter para encerrar');
  readln;
  
End.