Program Pzim; 

// Programa para validacao de data

function diasmes(mm,aa:integer):integer;
var diasma:integer;

Begin
  
  if ((mm=4) or (mm=6) or (mm=9) or (mm=11)) then
  diasma:=30
  else
  if (mm=2) Then
  begin
    diasma:=28;
    if (((aa mod 400)=0) or ((aa mod 4=0) and (aa mod 100<>0))) then    // bissexto
    diasma:=29;
  end
  else
  diasma:=31;
  diasmes:=diasma;
  
End;

function valdata(ddd,mmm,aaa:integer):boolean;
var chav:boolean;

Begin
  
  ddd:=diasmes(mmm,aaa);                      // valida como data possivel (dias entre 1 e 31, etc)
  chav:=true;
  if (ddd>31) or (ddd<1) then
  chav:=false;
  if (aaa<1950) or (aaa>3000) then
  chav:=false;
  if (mmm<1) or (mmm>12) then
  chav:=false;
  valdata:=chav;
  
End;

Procedure leia1(oque:string[30];var inter:integer);

var dm:string[20];
e:integer;

Begin 
  
  repeat
    writeln(oque, '=>');
    readln(dm);
    val(dm,inter,e);
    if (e>0) then
    writeln(' valor ilegal');
  until (e=0);
  
End;  

var dia,mes,ano:integer;

Begin  
  
  leia1 ('Digite o dia ',dia);
  leia1 ('Digite o mes ',mes);
  leia1 ('Digite o ano ',ano);
  
  if ((dia=diasmes(mes,ano)) and (valdata(dia,mes,ano))) then
  writeln('Data valida')
  else
  writeln('Data invalida');
  writeln('Enter para encerrar');
  readln;
  
End.  