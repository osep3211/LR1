program LR1_Osipov;

{$APPTYPE CONSOLE}

uses
SysUtils;

const
Z = 1000000;
type
mas = array[1..Z] of integer;
var
A: mas;
n, i, sr, p: integer;
input, output, f2, f3, f4: Text;
TimeDiff: TdateTime;
fileName: string;

procedure InsSort(var A: mas; len:integer; var sr, p: integer; var EllapsedTime: TdateTime);
var
x, m: integer;
i, j: integer;
D: TdateTime;
begin
D := Time();
p := 0;
sr := 0;
for i := 2 to len do
begin
x := a[i];
for j := i - 1 downto 1 do
begin
sr := sr + 1;
if a[j] > x then
begin
A[j + 1] := A[j];
A[j] := x;
p:= p + 1;
for m := 0 to n-1 do
     write (a[m],' ');
     writeln;

end;
end;
end;
EllapsedTime := Time() - D;
end;

procedure SelSort(var A: mas; len:integer; var sr, p: integer; var EllapsedTime: TdateTime);
var
x, m: integer;
i, j, k: integer;
D: TdateTime;
begin
D := Time();
p := 0;
sr := 0;
for i := 1 to len - 1 do
begin
k := i;
x := A[i];
for j := i + 1 to len do
begin
if A[j] < x then
begin
x := A[j];
k := j;
end;
sr := sr + 1;
end;
A[k] := A[i];
A[i] := x;
p := p + 1;
for m := 0 to n-1 do
write (a[m],' ');
writeln;
end;
EllapsedTime := Time() - D;
end;

procedure BubbleSort(var A: mas; len:integer; var sr, p: integer; var EllapsedTime: TdateTime);
var
x, m: integer;
i, j: word;
D: TdateTime;
DHour, DMin, DSec, DMilli: word;
begin
D := Time();
p := 0;
sr := 0;
for i := 1 to len do
begin
for j := len - 1 downto 1 do
begin
sr := sr + 1;
if A[j] > A[j + 1] then
begin
x := a[j];
A[j] := A[j + 1];
A[j + 1] := x;
p := p + 1;
for m := 0 to n-1 do
write (a[m],' ');
writeln;
end;
end;
end;
EllapsedTime := Time() - D;
end;

procedure fillInFileWithRandomInt(var fin: Text; len: integer);
var
i: integer;
begin
rewrite(fin);
writeln(fin, len);
for i := 1 to len do
write(fin, random(100000), ' ');
end;

procedure fillInArrayFromFile(var fin: Text; var Arr: mas);
var
i: integer;
len: integer;
begin
reset(fin);
readln(fin, len);
for i := 1 to len do
read(fin, Arr[i]);
end;

procedure outputArray(var Arr: mas; len:integer);
var
i: integer;
begin
for i := 1 to len do
write(Arr[i], ' ');
writeln;
end;

procedure fillInFileWithResults(var fout: Text; var Arr: mas; len:integer;
Method: string; numOfCompares, numOfPermutation: integer; diffTime: TdateTime);
var
i: integer;
DHour, DMin, DSec, DMilli: word;
begin
rewrite(fout);
writeln(fout, len);
for i := 1 to len do
write(fout, Arr[i], ' ');
writeln(fout);
writeln(fout, 'Method: ', Method);
writeln(fout, 'Num of Compares: ', numOfCompares);
writeln(fout, 'Num of Permutation: ', numOfPermutation);
DecodeTime(diffTime, DHour, DMin, DSec, DMilli);
writeln(fout, 'Time: ', DSec, ' seconds ', DMilli, ' miliseconds');
end;

begin
randomize;

writeln('Type in input file name:');
readln(fileName);

Assign(input, fileName);

writeln('Type in size of array (Max: ', Z, '):');
readln(n);

fillInFileWithRandomInt(input, n);
fillInArrayFromFile(input, A);


writeln('Type in output file name for Insertion Sort:');
readln(fileName);
InsSort(A, n, sr, p, TimeDiff);
AssignFile(output, fileName);
fillInFileWithResults(output, A, n, 'Insertion Sort', sr, p, TimeDiff);
CloseFile(output);

fillInArrayFromFile(input, A);

writeln('Type in output file name for Selection Sort:');
readln(fileName);
SelSort(A, n, sr, p, TimeDiff);
AssignFile(output, fileName);
fillInFileWithResults(output, A, n, 'Selection Sort', sr, p, TimeDiff);
CloseFile(output);

fillInArrayFromFile(input, A);

writeln('Type in output file name for Bubble Sort:');
readln(fileName);
BubbleSort(A, n, sr, p, TimeDiff);
AssignFile(output, fileName);
fillInFileWithResults(output, A, n, 'Bubble Sort', sr, p, TimeDiff);
CloseFile(output);

Close(input);
end.




