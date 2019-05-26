program Exercicio02;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Classes;

type
  TMatriz = array [0..25, 0..25] of char;
  TLetrasBasicas = Array[0..25] of char;

var
  Matriz : TMatriz;
  _Str: TStringList;


function GerarLetrasBasicas: TLetrasBasicas;
var
  i: integer;
begin
  for i := 0 to 25 do
    Result[i] := Chr(65+i);
end;

function GerarCifra: TMatriz;
var
  i3, i2, i: integer;
  LetrasBasicas: TLetrasBasicas;
begin
  LetrasBasicas := GerarLetrasBasicas;

  i3 := 0;

  for i := 0 to 25 do
  begin
    for i2 := 0 to 25 do
    begin
      if (i = 0) then
      begin
        Result[i2, i] := LetrasBasicas[i2];
      end
      else
      begin
        if ((i2 + i) > 25) then
        begin
          Result[i2, i] := LetrasBasicas[i3];
          i3 := i3 + 1;
        end
        else
          Result[i2, i] := LetrasBasicas[i2 + i];
      end;
    end;
    i3 := 0;
  end;
end;

function GetIndexFromArray(const aLetra: char; aLetrasBasicas: TLetrasBasicas): integer;
var
  i: integer;
begin
  Result := 0;
  for i := Low(aLetrasBasicas) to High(aLetrasBasicas) do
    if aLetrasBasicas[i] = aLetra then
    begin
      Result := i;
      break;
    end;

end;

function Decriptar(const aText, PalavraChave: string; Matriz: TMatriz): string;
var
  i, j, colunaID: integer;
  letra: Char;
  palavraChaveIndex, linhaID: integer;
  LetrasBasicas: TLetrasBasicas;
begin
  LetrasBasicas := GerarLetrasBasicas;
  palavraChaveIndex := 0;
  colunaID := 0;
  for i := 0 to Length(aText) do
  begin
    letra := aText[i];
    if Ord(letra) in [65..122]  then //'A'..'z'
    begin
      if Ord(letra) in [97..122] then
        letra := Chr(Ord(letra) - 32);  //maiusculas
      if (palavraChaveIndex < PalavraChave.Length) then
      begin
        linhaID := GetIndexFromArray(PalavraChave[palavraChaveIndex], LetrasBasicas);
        inc(palavraChaveIndex);
      end
      else
      begin
        palavraChaveIndex := 0;
        linhaID := GetIndexFromArray(PalavraChave[palavraChaveIndex], LetrasBasicas);
        inc(palavraChaveIndex);
      end;

      for j := 0 to 25 do
      begin
        if letra = Matriz[linhaId, j] then
        begin
          ColunaID := j;
          Break;
        end;
      end;

      Result := Result + Matriz[ colunaId, linhaId];

    end
    else
      Result := Result + letra;
  end;

end;

begin
  Matriz :=  GerarCifra;
  try
    _Str := TStringList.Create;
    try
      _Str.LoadFromFile('misterio.txt');
      writeln(Output, Decriptar(_Str.Text, 'rodrigo', Matriz));


      readln;
    finally
      _Str.Free;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
