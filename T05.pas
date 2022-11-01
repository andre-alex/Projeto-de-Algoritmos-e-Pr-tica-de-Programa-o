Program Pzim;  

// Programa para inverter ordem do nome Ex: Joao Silva -> SILVA, JOAO

function sobrenome(nome:string[40]):string[40];

var len,esp,pcsn,ucpn,a,paux:integer;
nomsobr:string[40];

begin
  len:=length(nome);
  esp:=len;
  
  repeat
    esp:=esp-1;
  until (nome[esp]=' ');   // encontra o espaco antes do ultimo nome
  
  pcsn:=esp+1;
  ucpn:=esp-1;
  paux:=0;
  nomsobr:='                                        ';
  
  for a:=pcsn to len do
  begin
    paux:=paux+1;
    nomsobr[paux]:=nome[a];   // insere o sobrenome no vetor
  end;
  
  paux:=paux+1;
  nomsobr[paux]:=',';
  paux:=paux+1;
  nomsobr[paux]:=' ';
  
  for a:=1 to ucpn do       // insere o restante do nome apos adicao de virgula e espaco
  begin
    paux:=paux+1;
    nomsobr[paux]:=nome[a];
  end;
  
  sobrenome:=nomsobr;
end;

var vet:array[1..50] of string[40];
aux,nom:string[40];
t,tot,a:integer;
troca:boolean;

begin
  
  while (nom<>'FIM') and (t<>50) do
  begin
    t:=t+1;
    writeln('Insira os nomes desejados ou FIM para encerrar');
    readln(nom);
    nom:=upcase(nom);
      if (nom<>'FIM') then
      vet[t]:=sobrenome(nom);
    end;
    tot:=t;
    
    repeat
      tot:=tot-1;
      troca:=true;
      for a:=1 to tot do
      if(vet[a]>vet[a+1])then
      begin
        aux:=vet[a];
        vet[a]:=vet[a+1];
        vet[a+1]:=aux;
        troca:=false;
      end;
    until troca;
    
    writeln('Menores que LZ em ordem alfabetica crescente ');
    
    for a:=1 to t do
    begin
      if (vet[a]<'LZ') then
      writeln(vet[a]);
    end;
    writeln;
    writeln('Maiores ou iguais a LZ em ordem alfabetica decrescente ');
    writeln;
    
    for a:=t downto 1 do
    begin
      if (vet[a]>='LZ') then
      writeln(vet[a]);
    end;
    
    writeln;
    writeln('Pressione qualquer tecla para encerrar ');
    readln;
    
  end.
  