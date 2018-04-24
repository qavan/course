unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls, ExtCtrls,unit2;

type
  list=^elem;
  elem=record
    manufacturer:String;
    diagonal:Real;
    processor:string;
    frequency:Real;
    ram:SmallInt;
    hddssd:integer;
    weight:real;
    cost:integer;
    next:list;
    prev:list;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  tslist,t:TStringList;

  L,L1:list;

implementation
{$R *.lfm}

{ TForm1 }


///LIST PROC-S
 procedure listinit(var L:list);
    begin
      new(L);
      L^.next:=nil;
      L^.manufacturer:='empty';
      L^.diagonal:=0;
      L^.processor:='empty';
      L^.frequency:=0;
      L^.ram:=0;
      L^.hddssd:=0;
      L^.weight:=0;
      L^.cost:=0;
      L^.prev:=nil;
    end;//ORIENT
 function listlength(L:list):integer;
   begin
     listlength:=0;
     if L^.manufacturer='empty' then begin ShowMessage('empty');Abort;end
     else
     begin
         while L^.next<>nil do
         begin
             listlength+=1;
             L:=L^.next;
         end;
     end;
   end;//ORIENT
 procedure insert(n:Integer;a1,a2,a3,a4,a5,a6,a7,a8:string;var L:list);
 var p:list;
 begin
   if n=0 then begin
        new(p);
        p^.manufacturer:=a1;
        p^.diagonal:=StrToFloat(a2);
        p^.processor:=a3;
        p^.frequency:=StrToFloat(a4);
        p^.ram:=StrToInt(a5);
        p^.hddssd:=StrToInt(a6);
        p^.weight:=StrToFloat(a7);
        p^.cost:=StrToInt(a8);
        p^.prev:=nil;
        L^.prev:=p;
        p^.next:=L;
        L:=p;
      end;

 end;

procedure printer(L:list);
var i:integer;s:string;
begin
 for i:=1 to listlength(L) do
  begin
    s:=L^.manufacturer+' '+FloatToStr(L^.diagonal)+' '+
    L^.processor+' '+FloatToStr(L^.frequency)+' '+
    IntToStr(L^.ram)+' '+IntToStr(L^.hddssd)+' '+
    FloatToStr(L^.weight)+' '+IntToStr(L^.cost);
    ShowMessage(s);
    L:=L^.next;
  end;
end;
///END OF LIST PROC-S
procedure updategrid(L:list);
var i:integer;
begin
 for i:=1 to listlength(L) do
  begin
     Form1.StringGrid1.Rows[i][0]:=L^.manufacturer ;
     Form1.StringGrid1.Rows[i][1]:=FloatToStr(L^.diagonal);
     Form1.StringGrid1.Rows[i][2]:=L^.processor;
     Form1.StringGrid1.Rows[i][3]:=FloatToStr(L^.frequency);
     Form1.StringGrid1.Rows[i][4]:=IntToStr(L^.ram);
     Form1.StringGrid1.Rows[i][5]:=IntToStr(L^.hddssd);
     Form1.StringGrid1.Rows[i][6]:=FloatToStr(L^.weight);
     Form1.StringGrid1.Rows[i][7]:=IntToStr(L^.cost);
     L:=L^.next;
  end;
end;
//////////
procedure TForm1.FormCreate(Sender: TObject);
var
  s:string;i:integer;
begin
   i:=1;
   tslist:=TStringList.Create;
   t:=TStringList.Create;
   tslist.LoadFromFile('list.txt');
   listinit(L);
   for s in tslist do
   begin
      i+=1;
       ExtractStrings([';'], [' '], pchar(s), t);
       insert(0,t[0],t[1],t[2],t[3],t[4],t[5],t[6],t[7],L);
       t.Clear;
       if i>=StringGrid1.RowCount then StringGrid1.RowCount:=StringGrid1.RowCount+1;
   end;
   updategrid(L);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage('Длина списка= '+IntToStr(listlength(L)));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

 printer(L);
end;

end.

