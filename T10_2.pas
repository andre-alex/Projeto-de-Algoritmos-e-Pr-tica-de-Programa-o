Program Pzim;  

// Programa para apresentar no console os candidatos classificados por determinados criterios

uses BIBLIONT;

CONST CARGOS:ARRAY [1..12] OF STRING[22]=
('ENGANADOR DE CHEFE    ','ENROLADOR DE TRABALHO ','PENSADOR              ','ANALISTA DE SISTEMAS  ',
'DEGUSTADOR DE CERVEJA ','TECNICO EM REDES      ','CONTADOR DE ESTORIAS  ','SAI DA AULA ANTES     ',
'ACOUGUEIRO LIMPINHO   ','SEGURANCA DE BANHEIRO ','GESTOR DE BORBOLETAS  ','AGENTE LEVA E TRAZ    ' );

var
arq:file of regis;
reg:regis;
vet:vetor;
a,b,ii,tot,i,e,opt,x,cargant:integer;
cs,ccs,cgs:string;

Begin
  assign(arq,'CAND.IND');
  reset(arq);
  
  writeln('Ordenação ');
  writeln('Opção 1 -> classificados por cargo em ordem alfabética ');
  writeln('Opção 2 -> classificação por cargo ');
  writeln('Opção 3 -> classificação geral ');
  
  repeat
    leia1('Insira ',opt);
    if ((opt<1) or (opt>3) or (e>0)) then
    writeln('Ilegal');
  until ((opt>0) and (opt<4));
  
  repeat
    ii:=a+1;
    vet[ii].pf:=a;
    read(arq,reg);
    
    if (opt=1) then
    begin
      str(reg.car:2,cS);
      vet[ii].cc:=cS+reg.nome;
    end
    else
    
    if (opt=2) then
    begin
      str(reg.car:2,cS);
      str(reg.clc:4,ccS);
      vet[ii].cc:=cS+ccS;
    end
    else
    
    begin
      str(reg.clg:4,cgS);
      vet[ii].cc:=cgS;
    end;
    a:=a+1;
  until (eof(arq));
  
  tot:=ii;
  writeln('Inicio da ordenação ');
  ordem(vet,ii);
  writeln('Fim da ordenação ');
  clrscr;
  
  if (opt=3) then
  writeln('ORDE  NUM NOME                                SOM  N4  N5  N3  N2  N6  N1 DATA ')
  else
  writeln('Enter para iniciar');
  writeln;
  
  for i:=1 to tot do
  begin 
    seek(arq,vet[i].pf);
    read(arq,reg);
    b:=b+1;
    
    if ((opt=1) and (reg.falta=0)) then
    begin
      if (reg.ccl>0) then
      begin
        if (cargant<>reg.car) then
        begin
          b:=0;
          readln;
          clrscr;
          writeln('NUM  NOME                                DATA         CAR   Cargo => ' ,cargos[reg.car]);
          writeln;
        end
        else
        writeln(reg.num:4 ,' ', reg.nome:35 ,' ', reg.data.dia:2,'/',reg.data.mes:2,'/',reg.data.ano:4,'  ',reg.car:2);
        cargant:=reg.car;
      end;
    end
    else
    
    if ((opt=2) and (reg.falta=0)) then
    begin
      if ((cargant<>reg.car) or (b=25)) then
      begin
        b:=0;
        readln;
        clrscr;
        writeln('NUM NOME                                 SOM  N4  N5  N3  N2  N6  N1 DATA      Cargo => ',cargos[reg.car]);
        writeln;
      end
      else
      writeln(reg.num:4 ,' ', reg.nome:35 ,' ', reg.som:3,' ', reg.notas[4]:3 ,' ', reg.notas[5]:3 ,' ', reg.notas[3]:3 ,' ', reg.notas[2]:3 ,' ', reg.notas[6]:3 ,' ', reg.notas[1]:3,' ', reg.data.dia:2,'/',reg.data.mes:2,'/',reg.data.ano:4);
      cargant:=reg.car;
    end
    else
    
    if ((opt=3) and (reg.falta=0)) then
    begin
      x:=x+1;
      if (b=25) then
      begin
        b:=0;
        readln;
        clrscr;
        writeln('ORDE  NUM NOME                                SOM  N4  N5  N3  N2  N6  N1 DATA ');
        writeln;
      end
      else
      writeln(x:4 ,' ', reg.num:4 ,' ', reg.nome:35 ,' ', reg.som:3 ,' ', reg.notas[4]:3 ,' ', reg.notas[5]:3 ,' ', reg.notas[3]:3 ,' ', reg.notas[2]:3 ,' ', reg.notas[6]:3 ,' ', reg.notas[1]:3 ,' ', reg.data.dia:2,'/',reg.data.mes:2,'/',reg.data.ano:4);
    end;
  end;
  
  clrscr;
  termine;
  close(arq);
End.