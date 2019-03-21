program Exercicio1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Classes;

var
  _Str: TStringList;
  _i, _j: integer;
  _chr: char;
  _newChr: char;
const
  _shift = 3;
  _alphabet_size = 26;

begin
{Implemente a cifra de César e recupere o significado do arquivo “misterio.txt”, em anexo
ao material da aula, que foi deslocado três casas para frente. Os caracteres especiais para
“espaço” e “nova linha” não foram codificados. O código utilizado para criptografar é:
...
int alphabet_size = 26;
int shift = ?; /*deslocamento!*/
char ch;
...
code = ((ch - ’a’) + shift) % alphabet_size + ’a’;}


  try
    _Str := TStringList.Create;
    try
      _Str.LoadFromFile('misterio.txt');
      for _i := 0 to _Str.Count -1 do //ler cada linha do arquivo
      begin
        for _j := 0 to _Str[_i].Length -1 do //ler caracter a caracter
        begin
          _chr := _Str[_i][_j];
          if CharInSet(_chr, [#0, #32, #13]) then
            _newChr := _chr
          else if (96 < ord(_chr)) and (ord(_chr) < (_shift + 97)) then
            _newChr := Chr((ord(_chr) + 26 - _shift))
          else
            _newChr := Chr( ord(_chr) - _shift);
          write(Output, _newchr);
        end;

      end;
    finally
      _Str.Free;
    end;
    System.Readln;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
    end;
  end;

end.


