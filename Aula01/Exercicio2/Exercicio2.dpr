program Exercicio2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Classes, System.Generics.Collections;


type
  TSalvaPares = class (TDictionary<string, integer>)
  public
  end;

var
  _Str: TStringList;
  _i, _j: integer;
  _Dict : TSalvaPares;

  _linha: string;
  _aux: string;
  _Pair: TPair<string, integer>;

begin
  try
    _Str := TStringList.Create;
    _Dict := TSalvaPares.Create;
    try
      _Str.LoadFromFile('carta.txt');

      for _i := 0 to _Str.Count -1 do //ler cada linha do arquivo
      begin
        //ler de dois em dois caracteres,
        //Guardar cada par em um incremento do objeto Dict SalvaPares
        _linha := _Str[_i];
        for _j := 1 to _linha.Length do
        begin
          if _linha[_j] in ['a'..'z','A'..'Z','1'..'9'] then
          begin
            if (_aux.Length = 2) or (_j = _linha.Length) then
            begin
              if _Dict.ContainsKey(_aux) then
                _Dict. Items[_aux] := _Dict.Items[_aux] + 1
              else
                _Dict.Add(_Aux, 1);
              _aux := _linha[_j];
            end
            else
              _aux := _aux + _linha[_j];
          end;
        end;
      end;
      for _Pair in _Dict do
        writeln(Format('Caracteres "%s" ocorrem %d vezes.', [_Pair.Key, _Pair.Value]));

      //Substituir por frequencia cada caractere
      //conforme tabela de frequencias da lingua portuguesa

    finally
      _Str.Free;
      _Dict.Free;
    end;
    System.Readln;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
    end;
  end;

end.

{
Frequencia de letras da lingua portuguesa:

A: 14,63%
E: 12,57%
O: 10,73%
S: 7,81%
R: 6,53%
I: 6,18%
N: 5,05%
D: 4,99%
M: 4,74%
U: 4,63%
T: 4,34%
C: 3,88%
L: 2,78%
P: 2,52%
V: 1,67%
G: 1,30%
H: 1,28%
Q: 1,20%
B: 1,04%
F: 1,02%
Z: 0,47%
J: 0,40%
X: 0,21%
K: 0,02%
Y: 0,01%
W: 0,01
}



