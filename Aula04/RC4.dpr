program RC4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  tfCiphers in 'tforge076\User\tfCiphers.pas',
  tfBytes in 'tforge076\User\tfBytes.pas';

var
	//state é a propriedade do objeto State que armazena o estado atual do gerador de sequências
  State : array [0..255] of integer;

procedure InicializaArray(const Key: string);
var
 i, j, swap, len: integer;
begin
  len := Key.Length;
  j := 0;
  //Preenche o array
  for i := Low(State) to High(State) do
    State[i] := i;

 //Embaralha ("aleatoriza" a estrutura que armazena o estado) o array de acordo com a chave fornecida pelo usuário
 for i := Low(State) to High(State) do
 begin
   //j = (j + this.state[i] + key.charAt((i % len))) % 256;
   j := (j + State[i] + Ord(Key[i mod len]) ) mod 256;
   swap := State[i];
   State[i] := State[j];
   State[j] := swap;
 end;
end;

procedure EncryptFile(const FileName: string; const Key: ByteArray);
begin
  TCipher.RC4.ExpandKey(Key)
             .Skip(1536)
             .EncryptFile(FileName, FileName + '.rc4');
end;

procedure DecryptFile(const FileName: string; const Key: ByteArray);
begin
  TCipher.RC4.ExpandKey(Key)
             .Skip(1536)
             .DecryptFile(FileName + '.rc4', FileName + '.bak');
end;

begin
  try
    InicializaArray('rodrigo');
    DecryptFile('cifrado.txt', ByteArray.FromText('rodrigo') );

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  readln;
end.
