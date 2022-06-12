unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBCtrls, DBGrids, ExtCtrls;

type

  { TFormBook }

  TFormBook = class(TForm)
    Button1: TButton; Button2: TButton;
    ButtonNext: TButton;
    ButtonEdit: TButton;

    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSourceDel: TDataSource;

    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;

    Edit1: TEdit;    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;  Label2: TLabel;
    Label3: TLabel;  Label4: TLabel;
    Label5: TLabel;

    SQLQuery1:   TSQLQuery;
    SQLQuery2:   TSQLQuery;
    SQLQuery:    TSQLQuery;
    SQLQueryZapros: TSQLQuery;
    SQLQueryDel: TSQLQuery;
    SQLQueryAdd: TSQLQuery;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonNextClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);

  private

  public
     procedure ActiveQueryAndClear;
  end;

var
  FormBook: TFormBook;

  idProducts : integer;
implementation
   uses Unit1;
{$R *.lfm} { TFormBook }

procedure TFormBook.FormShow(Sender: TObject);
  begin
    ActiveQueryAndClear;
  end;

procedure TFormBook.Button1Click(Sender: TObject);
  begin
    SQLQuery.Active:= False;
    SQLQueryAdd.Close;
    SQLQueryAdd.Clear;
    SQLQueryAdd.SQL.Text := 'insert into products(id,name, idWriter , idGenre , remark) values(:id, :name,  :idWriter , :idGenre , :remark); ';
    SQLQueryAdd.ParamByName('name').AsString := Edit1.Text;
    SQLQueryAdd.ParamByName('idWriter').AsInteger := DBLookupComboBox1.KeyValue;
    SQLQueryAdd.ParamByName('idGenre').AsInteger := DBLookupComboBox2.KeyValue;
    SQLQueryAdd.ParamByName('remark').AsString := Edit2.Text ;
    SQLQueryAdd.ExecSQL;
    Unit1.Form1.SQLT.Commit;
    ActiveQueryAndClear;
  end;


procedure TFormBook.Button2Click(Sender: TObject);
  begin
    SQLQuery.Active:= False;
    SQLQueryDel.Close;
    SQLQueryDel.SQL.Text := 'delete from products where id=:id ';
    SQLQueryDel.ParamByName('id').AsInteger := idProducts;
    SQLQueryDel.ExecSQL;
    Unit1.Form1.SQLT.Commit;
    ActiveQueryAndClear;
  end;

procedure TFormBook.ButtonEditClick(Sender: TObject);
begin
    SQLQuery.Active:= False;
    SQLQueryZapros.Close;
    SQLQueryZapros.sql.clear;

    SQLQueryZapros.SQL.Text := 'update products set name = :name, idWriter = :idWriter, ';
    SQLQueryZapros.SQL.Add('idGenre = :idGenre, remark = :remark ');
    SQLQueryZapros.SQL.Add('where id = :idProducts ');

    SQLQueryZapros.ParamByName('idProducts').AsInteger :=  idProducts;
    SQLQueryZapros.ParamByName('name').AsString :=  Edit1.Text;
    SQLQueryZapros.ParamByName('idWriter').AsInteger := DBLookupComboBox1.KeyValue;
    SQLQueryZapros.ParamByName('idGenre').AsInteger := DBLookupComboBox2.KeyValue;
    SQLQueryZapros.ParamByName('remark').AsString := Edit2.Text;

    SQLQueryZapros.ExecSQL;
    Unit1.Form1.SQLT.Commit;
    ActiveQueryAndClear;
  end;

procedure TFormBook.DBGrid1CellClick(Column: TColumn);
  begin
     idProducts := SQLQuery.FieldByName('id').AsInteger;
     Edit1.text := SQLQuery.FieldByName('name').AsString;
     Edit2.text := SQLQuery.FieldByName('remark').AsString;
     DBLookupComboBox1.KeyValue := SQLQuery.FieldByName('idWriter').AsInteger;
     DBLookupComboBox2.KeyValue := SQLQuery.FieldByName('idGenre').AsInteger;
  end;

procedure TFormBook.ActiveQueryAndClear;
  begin
     Unit1.Form1.SQLQuery.Active := True;
     SQLQuery.Active:= True;
     SQLQuery1.Active:= True;
     SQLQuery2.Active:= True;
     DBLookupComboBox1.ListFieldIndex :=  0 ;
     DBLookupComboBox2.ListFieldIndex :=  0 ;
      Edit1.text := '';
     Edit2.text  := '';
  end;



procedure TFormBook.ButtonNextClick(Sender: TObject);
begin
   Unit1.Form1.ActiveQueryAndClear;
   Unit1.Form1.Show;
end;

end.

