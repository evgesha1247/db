unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, MSSQLConn, SQLDB, DB, SQLite3Conn, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBGrids, DBCtrls, ExtCtrls, ComCtrls;

type
  { TForm1 }
  TForm1 = class(TForm)
    Button: TButton;
    Button1: TButton;
    Button2: TButton; Button3: TButton;
    Button4: TButton;

    DBGrid1: TDBGrid;
    DataS: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;




    SQLQuery: TSQLQuery;
    SQLQueryZapros: TSQLQuery;
    SQLT: TSQLTransaction;
    SQLC: TSQLite3Connection;


    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

    procedure ButtonClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlDBError(const errorStr: string) ;
  private

  public

  end;

var
   Form1: TForm1;
   IDPublisher : integer;
implementation
   uses Unit3 , Unit4;
{$R *.lfm} { TForm1 }

 
procedure TForm1.FormCreate(Sender: TObject);
  begin
    SQLC.DatabaseName := '/home/evg/Документы/практика/lazDB/db/writes';
    SQLC.CharSet := 'UTF8';
    SQLC.Transaction := SQLT;

  end;

procedure TForm1.FormShow(Sender: TObject);
  begin
     try
       SQLQuery.SQL.Text:= 'select publishers.id,writers.name,writers.patronymic,writers.surname,products.name, publishingHouse.publisherName ,bookBinding.name ,publishers.circulation from publishers left join products on publishers.idProduct = products.id left join bookBinding on publishers.idBookBinding = bookBinding.id left join writers on  products.idWriter = writers.id  left join publishingHouse on publishers.idPublisHers = publishingHouse.id ' ;
       SQLC.Open;
       SQLC.Connected := True;
       SQLQuery.Active := True;
       SQLT.Active := True;
     except sqlDBError('база не подключена')
     end;
  end;

procedure TForm1.ButtonClick(Sender: TObject);
  begin
     Unit3.Form5.Show;
  end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
  begin
    IDPublisher := SQLQuery.FieldByName('id').AsInteger;
  end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
   if Edit2.text = '' then begin
      SQLQuery.Active := false;
      SQLQuery.SQL.Text:= 'select publishers.id,writers.name,writers.patronymic,writers.surname,products.name, publishingHouse.publisherName ,bookBinding.name ,publishers.circulation from publishers left join products on publishers.idProduct = products.id left join bookBinding on publishers.idBookBinding = bookBinding.id left join writers on  products.idWriter = writers.id  left join publishingHouse on publishers.idPublisHers = publishingHouse.id ' ;
      SQLQuery.Active := True;
   end
   else begin
     SQLQuery.Active := false;
      SQLQuery.SQL.Text:= 'select publishers.id,writers.name,writers.patronymic,writers.surname,products.name, publishingHouse.publisherName ,bookBinding.name ,publishers.circulation from publishers left join products on publishers.idProduct = products.id left join bookBinding on publishers.idBookBinding = bookBinding.id left join writers on  products.idWriter = writers.id  left join publishingHouse on publishers.idPublisHers = publishingHouse.id where  writers.surname like ''%' + edit2.text + '%'';';
     SQLQuery.Active := True;
    end;
end;


procedure TForm1.Button3Click(Sender: TObject);
  begin
     Unit4.Form6.Show;
  end;


procedure TForm1.Button2Click(Sender: TObject);
  begin
    SQLQuery.Active:= False;
    SQLQueryZapros.Close;
    SQLQueryZapros.SQL.Text := 'delete from publishers where id=:id ';
    SQLQueryZapros.ParamByName('id').AsInteger := IDPublisher;
    SQLQueryZapros.ExecSQL;
    SQLT.Commit;
    SQLQuery.Active:= True;
  end;


procedure TForm1.sqlDBError(const errorStr: string);
  begin
      ShowMessage('ERROR: ' + errorStr);
  end;






end.

