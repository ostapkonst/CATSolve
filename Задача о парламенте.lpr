program GameInElections;

{-------------------------------------------------------------------------------
В колонии на осваиваемой планете решили выбрать органы управления. Посовещавшись
колонисты решили, что будет достаточно, если в парламенте будет хотя бы один
член каждой партии. Помогите организовать такой, как можно более малочисленный,
парламент, в котором будут представлены члены всех партий.

ВХОД:
1 2 3 4
2
3 1 4 2
4 2
5 4

ВЫХОД:
4 2
-------------------------------------------------------------------------------}

const
  MAX = 150; // Максимальное количество партий и жителей

type
  Election = record
    Name: integer; // Имя жителя
    Count: integer; // Количество партий, которые представляет житель
    Partys: set of 1..MAX; // Список партий, которые представляет житель
  end;

var
  A: array[1..MAX] of Election; // Массив жителей

//----------------------------------------------------------------------------//

  procedure Swap(var a, b: Election);
  var
    temp: Election;
  begin
    temp := a;
    a := b;
    b := temp;
  end;

  // Сортировка взята с http://informatics.mccme.ru/mod/book/view.php?id=2605
  // Есть альтернатива https://acmp.ru/article.asp?id_text=167
  procedure QuickSort(l, r: integer);
  var
    border, i: integer;
  begin
    if l < r then
    begin
      border := l;
      for i := l to r - 1 do
        if (A[i].Count > A[r].Count) then
        begin
          Swap(A[border], A[i]);
          Inc(border);
        end;
      Swap(A[border], A[r]);
      QuickSort(l, border - 1);
      QuickSort(border + 1, r);
    end;
  end;

//---------------------------=Ввод данных из файла=---------------------------//

var
  N: integer = 0; // Количество партий

  procedure InputFromFile(inp: string);
  var
    Value: integer;
  begin
    Assign(input, inp);
    Reset(input);
    repeat
      Inc(N);
      repeat
        Read(Value);
        with A[Value] do
        begin
          Name := Value;
          Count += 1;
          Partys += [N];
        end;
      until EOLn;
      ReadLn();
    until EOF;
    Close(input);
  end;

//---------------------------=Вывод данных в файл=----------------------------//

var
  k: integer = 0;
  Ans: array[1..MAX] of integer;

  procedure OutputToFile(outp: string);
  var
    i: integer;
  begin
    Assign(output, outp);
    ReWrite(output);
    for i := 1 to k do
      Write(Ans[i], ' ');
    Close(output);
  end;

//----------------------------------------------------------------------------//

var
  Number: integer = 0;
  i, j: integer;
begin
  InputFromFile('input.txt');

  repeat
    Inc(k);
    QuickSort(1, MAX);
    Number += A[1].Count;
    Ans[k] := A[1].Name;

    i := 2;
    while A[i].Count > 0 do
    begin
      A[i].Partys -= A[1].Partys;

      A[i].Count := 0;
      for j := 1 to MAX do
        if j in A[i].Partys then
          Inc(A[i].Count);

      Inc(i);
    end;

    A[1].Partys := [];
    A[1].Count := 0;
  until Number = N;

  OutputToFile('output.txt');
end.
