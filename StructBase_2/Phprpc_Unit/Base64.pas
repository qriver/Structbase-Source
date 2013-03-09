{
/**********************************************************\
|                                                          |
| The implementation of PHPRPC Protocol 3.0                |
|                                                          |
| Base64.pas                                               |
|                                                          |
| Release 3.0.2                                            |
| Copyright by Team-PHPRPC                                 |
|                                                          |
| WebSite:  http://www.phprpc.org/                         |
|           http://www.phprpc.net/                         |
|           http://www.phprpc.com/                         |
|           http://sourceforge.net/projects/php-rpc/       |
|                                                          |
| Authors:  Ma Bingyao <andot@ujn.edu.cn>                  |
|                                                          |
| This file may be distributed and/or modified under the   |
| terms of the GNU General Public License (GPL) version    |
| 2.0 as published by the Free Software Foundation and     |
| appearing in the included file LICENSE.                  |
|                                                          |
\**********************************************************/

/* Base64 library.
 *
 * Copyright: Ma Bingyao <andot@ujn.edu.cn>
 * Version: 3.0.2
 * LastModified: Oct 30, 2009
 * This library is free.  You can redistribute it and/or modify it under GPL.
 */
}

unit Base64;

{$I PHPRPC.inc}

interface

function Encode(const Data: AnsiString): string;
function Decode(const Data: string): AnsiString;

implementation

const

  Base64EncodeChars: array[0..63] of Char = (
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
    'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
    'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
    'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3',
    '4', '5', '6', '7', '8', '9', '+', '/');

  Base64DecodeChars: array[0..255] of SmallInt = (
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1,
    -1,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1,
    -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);

function Encode(const Data: AnsiString): string;
var
  R, Len, I, J, L : Longint;
  C : LongWord;
begin
  Result := '';
  Len := Length(Data);
  if Len = 0 then Exit;
  R := Len mod 3;
  Dec(Len, R);
  L := (Len div 3) * 4;
  if (R > 0) then Inc(L, 4);
  SetLength(Result, L);
  I := 1;
  J := 1;
  while (I <= Len) do
  begin
    C := Ord(Data[I]);
    Inc(I);
    C := (C shl 8) or Ord(Data[I]);
    Inc(I);
    C := (C shl 8) or Ord(Data[I]);
    Inc(I);
    Result[J] := Base64EncodeChars[C shr 18];
    Inc(J);
    Result[J] := Base64EncodeChars[(C shr 12) and $3F];
    Inc(J);
    Result[J] := Base64EncodeChars[(C shr 6) and $3F];
    Inc(J);
    Result[J] := Base64EncodeChars[C and $3F];
    Inc(J);
  end;
  if (R = 1) then
  begin
    C := Ord(Data[I]);
    Result[J] := Base64EncodeChars[C shr 2];
    Inc(J);
    Result[J] := Base64EncodeChars[(C and $03) shl 4];
    Inc(J);
    Result[J] := '=';
    Inc(J);
    Result[J] := '=';
  end
  else if (R = 2) then
  begin
    C := Ord(Data[I]);
    Inc(I);
    C := (C shl 8) or Ord(Data[I]);
    Result[J] := Base64EncodeChars[C shr 10];
    Inc(J);
    Result[J] := Base64EncodeChars[(C shr 4) and $3F];
    Inc(J);
    Result[J] := Base64EncodeChars[(C and $0F) shl 2];
    Inc(J);
    Result[J] := '=';
  end;
end;

function Decode(const Data: string): AnsiString;
var
  R, Len, I, J, L : Longint;
  B1, B2, B3, B4: SmallInt;
begin
  Result := '';
  Len := Length(Data);
  if (Len = 0) or (Len mod 4 > 0) then Exit;
  R := 0;
  if (Data[Len - 1] = '=') then R := 1 else if (Data[Len] = '=') then R := 2;
  L := Len;
  if (R > 0) then Dec(L, 4);
  L := (L div 4) * 3;
  Inc(L, R);
  SetLength(Result, L);
  I := 1;
  J := 1;
  while (I <= Len) do
  begin
    repeat
      B1 := Base64DecodeChars[Ord(Data[I])];
      Inc(I);
    until ((I > Len) or (B1 <> -1));
    if (B1 = -1) then Break;

    repeat
      B2 := Base64DecodeChars[Ord(Data[I])];
      Inc(I);
    until ((I > Len) or (B2 <> -1));
    if (B2 = -1) then Break;

    Result[J] := AnsiChar((B1 shl 2) or ((B2 and $30) shr 4));
    Inc(J);

    repeat
      if (Data[I] = '=') then Exit;
      B3 := Base64DecodeChars[Ord(Data[I])];
      Inc(I);
    until ((I > Len) or (B3 <> -1));
    if (B3 = -1) then Break;

    Result[J] := AnsiChar(((B2 and $0F) shl 4) or ((B3 and $3C) shr 2));
    Inc(J);

    repeat
      if (Data[I] = '=') then Exit;
      B4 := Base64DecodeChars[Ord(Data[I])];
      Inc(I);
    until ((I > Len) or (B4 <> -1));
    if (B4 = -1) then Break;
    Result[J] := AnsiChar(((B3 and $03) shl 6) or B4);
    Inc(J);
  end;
end;

end.
