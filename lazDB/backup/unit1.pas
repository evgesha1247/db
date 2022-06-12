unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, MSSQLConn, SQLDB, DB, SQLite3Conn, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBGrids, DBCtrls, ExtCtrls, ComCtrls;

type
  { TForm1 }
  TForm1 = class(TForm)
    ButtonBooks: TButton;
    ButtonAdd: TButton;
    ButtonDel: TButton; ButtonWriters: TButton;
    ButtonEdit: TButton;

    DBGrid1: TDBGrid;
    DataS: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DS2: TDataSource;
    DS3: TDataSource;
    DS4: TDataSource;
    EditKol: TEdit;
    EditSearch: TEdit;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SQLQ2: TSQLQuery;
    SQLQ3: TSQLQuery;
    SQLQ4: TSQLQuery;

    SQLQuery: TSQLQuery;
    SQLQueryAdd: TSQLQuery;
    SQLQueryZapros: TSQLQuery;
    SQLT: TSQLTransaction;
    SQLC: TSQLite3Connection;

    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonDelClick(Sender: TObject);
    procedure ButtonWritersClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);

    procedure ButtonBooksClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);


    procedure EditSearchChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sqlDBError(const errorStr: string) ;
  private

  public
    procedure ActiveQueryAndClear;
  end;

var
   Form1 : TForm1;
   Id : integer;

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
       SQLC.Open;
       SQLC.Connected := True;
       SQLQuery.Active := True;
       SQLT.Active := True;
     except sqlDBError('база не подключена')
     end;
     ActiveQueryAndClear;
  end;



procedure TForm1.DBGrid1CellClick(Column: TColumn);
  begin
    id := SQLQuery.FieldByName('id').AsInteger;
    DBLookupComboBox2.KeyValue := SQLQuery.FieldByName('idProduct').AsInteger;
    DBLookupComboBox3.KeyValue := SQLQuery.FieldByName('idPublisHers').AsInteger;
    DBLookupComboBox4.KeyValue := SQLQuery.FieldByName('idBookBinding').AsInteger;
    EditKol.Text :=  SQLQuery.FieldByName('circulation').AsString;
  end;

procedure TForm1.EditSearchChange(Sender: TObject);
begin
   if EditSearch.text = '' then begin
      SQLQuery.Active := false;
      SQLQuery.SQL.Text:= 'select products.idWriter,publishers.idProduct,publishers.idBookBinding ,publishers.idPublisHers ,  publishers.id,writers.name,writers.patronymic,writers.surname,products.name, publishingHouse.publisherName ,bookBinding.name ,publishers.circulation from publishers left join products on publishers.idProduct = products.id left join bookBinding on publishers.idBookBinding = bookBinding.id left join writers on  products.idWriter = writers.id  left join publishingHouse on publishers.idPublisHers = publishingHouse.id ' ;
      SQLQuery.Active := True;
   end
   else begin
      SQLQuery.Active := false;
      SQLQuery.SQL.Text:= 'select products.idWriter,publishers.idProduct,publishers.idBookBinding ,publishers.idPublisHers ,  publishers.id,writers.name,writers.patronymic,writers.surname,products.name, publishingHouse.publisherName ,bookBinding.name ,publishers.circulation from publishers left join products on publishers.idProduct = products.id left join bookBinding on publishers.idBookBinding = bookBinding.id left join writers on  products.idWriter = writers.id  left join publishingHouse on publishers.idPublisHers = publishingHouse.id where  writers.surname like ''%' + EditSearch.text + '%'';';
      SQLQuery.Active := True;
    end;
end;

procedure TForm1.ButtonAddClick(Sender: TObject);
begin
    SQLQuery.Active:= False;
    SQLQueryAdd.Close;
    SQLQueryAdd.Clear;
    SQLQueryAdd.SQL.Text := 'insert into publishers(id, idPublisHers, idProduct, idBookBinding, circulation) values(:id, :idPublisHers, :idProduct, :idBookBinding, :circulation); ';
    SQLQueryAdd.ParamByName('idProduct').AsInteger := DBLookupComboBox2.KeyValue;
    SQLQueryAdd.ParamByName('idPublisHers').AsInteger := DBLookupComboBox3.KeyValue;
    SQLQueryAdd.ParamByName('idBookBinding').AsInteger := DBLookupComboBox4.KeyValue;
    SQLQueryAdd.ParamByName('circulation').AsString := EditKol.Text ;
    SQLQueryAdd.ExecSQL;
    Unit1.Form1.SQLT.Commit;
    ActiveQueryAndClear;
end;

procedure TForm1.ButtonEditClick(Sender: TObject);
begin
    SQLQuery.Active:= False;
    SQLQueryZapros.Close;
    SQLQueryZapros.SQL.Text := 'update publishers set idProduct = :idProduct, idPublisHers = :idPublisHers, idBookBinding = :idBookBinding, circulation = :circulation where id = :id ; ';
    SQLQueryZapros.ParamByName('id').AsInteger :=  id;
    SQLQueryZapros.ParamByName('idProduct').AsInteger := DBLookupComboBox2.KeyValue;
    SQLQueryZapros.ParamByName('idPublisHers').AsInteger := DBLookupComboBox3.KeyValue;
    SQLQueryZapros.ParamByName('idBookBinding').AsInteger := DBLookupComboBox4.KeyValue;
    SQLQueryZapros.ParamByName('circulation').AsString := EditKol.Text ;
    SQLQueryZapros.ExecSQL;
    SQLT.Commit;
    ActiveQueryAndClear;
end;

procedure TForm1.ButtonDelClick(Sender: TObject);
  begin
    SQLQuery.Active:= False;
    SQLQueryZapros.Close;
    SQLQueryZapros.SQL.Text := 'delete from publishers where id=:id ';
    SQLQueryZapros.ParamByName('id').AsInteger := id;
    SQLQueryZapros.ExecSQL;
    SQLT.Commit;
    ActiveQueryAndClear;
  end;

procedure TForm1.ButtonWritersClick(Sender: TObject);
   begin
     Unit4.Form6.Show;
   end;

procedure TForm1.ButtonBooksClick(Sender: TObject);
   begin
     Unit3.FormBook.Show;
   end;

procedure TForm1.sqlDBError(const errorStr: string);
  begin
    ShowMessage('ERROR: ' + errorStr);
  end;

procedure TForm1.ActiveQueryAndClear;
  begin
     SQLQuery.Active:= True;
     SQLQ2.Active:= True;
     SQLQ3.Active:= True;
     SQLQ4.Active:= True;

     DBLookupComboBox2.ListFieldIndex :=  0 ;
     DBLookupComboBox3.ListFieldIndex :=  0 ;
     DBLookupComboBox4.ListFieldIndex :=  0 ;
     EditKol.text := '';
  end;




end.

