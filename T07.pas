Program Pzim;   

// Programa para inserir gabarito, correcao e calculo de pesos por materia e insercao em novo arquivo

uses BIBLIONT;

const iniq:array [1..6] of integer=(5,10,20,30,50,60);
fimq:array [1..6] of integer=(9,19,29,49,59,64);
peso:array[1..6] of integer=(20,10,10,5,10,20);

var arql1,arql2:text;
reg1:string[64];
reg2:string[28];
notas:array[1..6] of integer;
num:string[4];
nn:array[1..6] of string[4];
chave:boolean;
gaba:string[64];
i,a,n,x,posi,l:integer;

Begin
  
  assign(arql1,'prova.txt');
  assign(arql2,'NOTAS.TXT');
  reset(arql1);
  rewrite(arql2);
  
  begin                           //insercao do gabarito e validacao
    repeat
      chave:=true;
      writeln('digite o gabarito ');
      readln(gaba);
      gaba:=upcase(gaba);
        l:=length(gaba);
        i:=1;
        repeat
          if ((l<60) or (l>60)) then
          chave:=false;
          if ((gaba[i]<'A') or (gaba[i]>'E')) then
          chave:=false;
          i:=i+1;
        until ((i>60) or (not chave));
      until (chave);      
    end;     
    
    repeat                              //copia o numero de inscricao do candidato (para posterior uso)
      n:=n+1;      
      readln(arql1,reg1);      
      num:=copy(reg1,1,4);      
      insert(num,reg2,1);      
      posi:=5;
			      
      for a:=1 to 6 do                   //calculo de acertos e da nota com peso
      begin       
        notas[a]:=0;        
        for x:=iniq[a] to fimq[a] do        
        if (reg1[x]=gaba[x-4]) then        
        notas[a]:=notas[a]+1;        
        notas[a]:=notas[a]*peso[a];        
        str(notas[a]:4,nn[a]);        
        insert(nn[a],reg2,posi);        
        posi:=posi+4;        
      end;      
      writeln(arql2,reg2);      
    until eof(arql1);
    
    writeln('registros lidos= ',n:7);   
    close (arql1);    
    close (arql2);
    
  End.