Program Pzim; 

// Programa para inserir as notas em um arquivo com as informacoes dos candidatos 

uses bibliont;

const x:array[1..6] of integer=(5,9,13,17,21,25);  

var

arq:file of regis;
reg:regis;
notas:text;

vet:vetor;
a,b,c,posiv,np,ii,tot,tc,tt,i,e:integer;
numa,num:string[4];
all:string[28];
notasS:array [1..6] of string[4]; 
notasI:array [1..6] of integer;   

Begin
  
  assign(arq,'CAND.IND');
  assign(notas,'NOTAS.TXT');
  reset(arq);
  reset(notas);
  
  repeat
    
    read(arq,reg);
    ii:=a+1;          
    vet[ii].pf:=a;    
    str(reg.num,num);
    tc:=length(num);
    for b:=1 to 4-tc do
    insert('0',num,1);  
    vet[ii].cc:=num;
    a:=a+1;
    
  until(eof(arq));
  
  
  tot:=ii; 
  writeln(' Inicio da ordenacao do vetor'); 
  ordem(vet,ii);   
  writeln(' Fim da ordenação '); 
  writeln(' Enter para continuar ');
  readln;  
  writeln('Inicio do registro de notas ');
  
  repeat    
    tt:=tt+1;
    readln(notas,all);          
    numa:=copy(all,1,4);
    pebin1(vet,numa,tot,posiv);
    
    seek(arq,vet[posiv].pf);
    read(arq,reg);
    
    for i:=1 to 6 do
    begin
      notasS[i]:=copy(all,x[i],4);        
      val (notasS[i],notasI[i],e);
      reg.notas[i]:=notasI[i];
    end;
    
    reg.som:=0;
    
    for i:=1 to 6 do
    reg.som:=reg.som+notasI[i];
    
    seek(arq,vet[posiv].pf);
    write(arq,reg);    
  until eof(notas);
  
  writeln;
  writeln('Fim do registro, use LISTAINDDIR.PAS para verificar o resultado');
  writeln('Foram lidos ',tt:6,' registros ');
  
  termine;
  
  close(notas);
  close(arq);
  
End.