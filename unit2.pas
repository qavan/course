unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    addb: TButton;
    findb: TButton;
    delb: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    title: TLabel;
    procedure addbClick(Sender: TObject);
    procedure delbClick(Sender: TObject);
    procedure findbClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  Form2: TForm2;

implementation
uses unit1;
{$R *.lfm}

{ TForm2 }

procedure TForm2.addbClick(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.delbClick(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.findbClick(Sender: TObject);
begin
   Form2.Close;
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Edit1.Caption:='';
  Edit2.Caption:='';
  Edit3.Caption:='';
  Edit4.Caption:='';
  Edit5.Caption:='';
  Edit6.Caption:='';
  Edit7.Caption:='';
  Edit8.Caption:='';
end;

end.

