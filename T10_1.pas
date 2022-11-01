Program Pzim; 

// Programa para calculo e registro dos candidatos classificados nas diversas vagas

uses bibliont;

const nvagas:array [1..12] of integer=(20,15,17,18,15,20,14,12,17,18,17,20);

var

arq:file of regis;
reg:regis;
vagas:text;

vet:vetor;
a,b,c,posiv,np,ii,tot,tc,tt,i,e,dataI,cont,dataCalc:integer;
cargo:array [1..12] of integer;
stringao:string[35];
dataS:string[6];
somS:string[3];
notasS:array[1..6] of string[3];
dataR:string[8];                   

Begin
  
  assign(arq,'CAND.IND');
  assign(vagas,'VAGAS.TXT');
  reset(arq);
  reset(vagas);
  
  repeat    
    dataI:=0;                      
    dataCalc:=0;
    dataR:=' ';
    
    read(arq,reg);                 
    ii:=a+1;
    vet[ii].pf:=a;
    
    str (reg.som:3,somS);                        
    for i:=1 to 6 do                               
    str (reg.notas[i]:3,notasS[i]);                
    dataR:=reg.data.ano+reg.data.mes+reg.data.dia;      
    val(dataR,dataI,e);                                 
    dataCalc:=20200101-dataI;                           
    str(dataCalc:6,dataS);
    stringao:=somS+notasS[4]+notasS[5]+notasS[3]+notasS[2]+notasS[6]+notasS[1]+dataS; 
                                   
    vet[ii].cc:=stringao;        
    a:=a+1;   
  until (eof(arq));
  
  tot:=ii;
  writeln('SOM N4 N5 N3 N2 N6 N1[DATA]      PF');     
  for i:=1 to 20 do
  writeln(vet[i].cc, '   ',vet[i].pf:5);
  
  writeln;
  writeln('Enter para continuar');
  readln;
  
  writeln(' Inicio da ordenacao do vetor ');
  ordem(vet,ii);
  writeln(' Fim da ordenação ');
  
  writeln('SOM N4 N5 N3 N2 N6 N1[DATA]      PF');
  for i:=1 to 20 do
  writeln(vet[i].cc, '   ',vet[i].pf:5);
  writeln(' Enter para continuar ');
  readln;
  writeln('Inicio do registro ');
  
  for i:=tot downto 1 do
  begin    
    seek(arq,vet[i].pf);
    read(arq,reg);
    
    cont:=cont+1;
    reg.clg:=cont;
    cargo[reg.car]:=cargo[reg.car]+1;
    reg.clc:=cargo[reg.car];
    	if (cargo[reg.car] <= nvagas[reg.car]) then      
    	reg.ccl:=reg.car;                                

    seek(arq,vet[i].pf);
    write(arq,reg);   
  end;
  
  writeln;
  writeln('Fim do registro ');
  
  termine;
  
  close(vagas);
  close(arq);
  
End.