program Exercicio01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Classes;

var
 _Str: TStringList;
 Matriz: array[0..25, 0..25]  of char;

 const
   alphabet_size = 26;
   chave = 'emily';

//lh_pelegrin@hotmail.com

  procedure PopulaMatriz;
  var
    i, j: integer;
  begin
    for i := 0 to alphabet_size do
    begin
      for j := 0 to alphabet_size do
      begin
        Matriz[i,j] := Chr((i + j) mod alphabet_size + Ord('a'));
      end;
    end;
  end;

  procedure CodificaArquivo;
  var
    i, j: integer;
    _chr: char;
    _PosChave: integer;
    _x, _y: integer;
  begin
    _Str := TStringList.Create;
    try
      _Str.LoadFromFile('poema.txt');
      _PosChave := 1;
      for i := 0 to _Str.Count - 1  do
      begin
        for j := 0 to _Str[i].Length - 1 do //ler caracter a caracter
        begin
          _chr := _Str[i][j];
          if not CharInSet(_chr, [#0, #32, #13]) then
          begin
            _x := Ord(_chr) - 96;
            _y := Ord(chave[_PosChave]) - 96;
            _chr := Matriz[_y-1, _x-1];
            inc(_PosChave);
            if _PosChave = chave.Length then
              _PosChave := 1;
          end;
          write(Output, _chr);
        end;
      end;

    finally
      _Str.Free;
    end;
  end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    PopulaMatriz;
    CodificaArquivo;
    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
