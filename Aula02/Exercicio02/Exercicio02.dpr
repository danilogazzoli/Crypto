program Exercicio02;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Classes;


(*

vigenere = function(phrase, keyword, state){
	let cypher = '';
	// keyword must contains only upper case letters A-Z
	keyword = keyword.onlyLetters().toUpperCase();
	let j = 0; // counts character to use in keyword
	for (i=0; i<phrase.length; i++){
		val = phrase.charOrdinalCodeAt(i);
		if (val<0) enci = phrase[i]; // when character is not a letter simply return it
		else {
			enci = (((val % 26) + state*keyword.charOrdinalCodeAt(j)) + 26) % 26;
			enci = String.fromCharCode(enci+65);
			if (val>25) enci = enci.toLowerCase();
			j = (j + 1) % keyword.length;

		}
		cypher+=enci;
	}
	return cypher;
}
*)
var
  _str : TStringList;
(*
function Vigenere(Frase, Chave: string; Estado: integer): string;
var
  j, i: integer;
  _chr: char;
  _val: integer;
begin
   Result := '';
   j := 0; //conta caracter para usar na chave
   Chave := Chave.ToUpper;
   for i := 0 to (Frase.Length - 1) do
   begin
     _chr := Frase[i];
     _val := Ord(Frase[i]);
     if not CharInSet(_chr, [#0, #32, #13]) then
     begin
			_chr := Chr(((_val mod 26) + Estado*Ord(Chave[j]) + 26) mod 26);
			_chr := Chr(Ord(_chr)+65);
			if (_val>25) then _chr = _chr.toLowerCase();
 			j := (j + 1) mod Chave.length;
     end;
     Result := Result + _chr;
   end;
end;

decrypt(cypher) {
		var text = '';
		for(let i =0; i<cypher.length; i++) {
			if(cypher[i] === " ") {
				text += cypher[i];
			} else {
				text += String.fromCharCode(((((cypher.charCodeAt(i) - this.key.charCodeAt(i)) % 26)+26)%26)+65)
			}
		}
		return text;
}

*)

function Decrypt(Frase, Chave: string) : string;
var
  k: integer;
  i: integer;
  _Chr: char;
  _NewChr: char;
begin
  Result := EmptyStr;
  for i := 0 to Frase.Length - 1 do
  begin
    if (k = chave.Length) then
      k := 0;
    _Chr := Frase[i];
    if  CharInSet(_chr, [#0, #32, #13]) then
      Result := Result + _Chr
    else
      Result := Result + Chr((((Ord(_Chr) - Ord(Chave[i]) mod 26)+26)mod 26) + 65 );
   //((((cypher.charCodeAt(i) - this.key.charCodeAt(i)) % 26)+26)%26)+65

  end;

end;


begin
  try
    _Str := TStringList.Create;
    try
      _Str.LoadFromFile('misterio.txt');
      writeln(Output, Decrypt(_Str.Text, 'rodrigo'));
      readln;
    finally
      _Str.Free;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
