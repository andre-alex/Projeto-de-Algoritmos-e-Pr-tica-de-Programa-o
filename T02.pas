Program Pzim;  

// Programa para calculo de medias encerrado por uma nota negativa

var num,soma,nota:integer;
var mr:real;

Procedure leia1(oque:string[30];var inter:integer);  // procedimento para transformar string em inteiro

var dm:string[20];
e:integer;

begin
  repeat
    writeln(oque, '=>');
    readln(dm);
    val(dm,inter,e);
    if (e>0) then
    writeln(' valor ilegal');
  until (e=0);
end;

Begin

  while (nota>=0) do
  begin
    repeat
      leia1('Digite a nota',nota);
      if (nota>100) then
      writeln(' Ilegal ');
    until (nota<=100);
    if (nota>=0) then
    begin
      num:=num+1;
      soma:=soma+nota;
    end;
  end;
  
  if (num<>0) Then
  mr:=soma/num;
  
  writeln('Foram lidas' ,num:3, ' notas');
  writeln('A média das notas é ' ,mr:3:2);
  writeln('Enter para encerrar');
  readln;
  
End.
































