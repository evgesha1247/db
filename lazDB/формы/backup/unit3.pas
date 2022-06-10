unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBCtrls, DBGrids, ExtCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton; Button2: TButton;
    Button3: TButton;

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
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBLookupComboBox1Select(Sender: TObject);
    procedure DBLookupComboBox2Select(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

  public
     procedure ActiveQuery;
  end;

var
  Form5: TForm5;
  idWriter: integer;
  idGenre : integer;
  id : integer;
implementation
   uses Unit1;
{$R *.lfm} { TForm5 }

procedure TForm5.Button1Click(Sender: TObject);
  begin
    SQLQuery.Active:= False;
    SQLQueryAdd.Close;
    SQLQueryAdd.Clear;
    SQLQueryAdd.SQL.Text := 'insert into products(id,name, idWriter , idGenre , remark) values(:id, :name,  :idWriter , :idGenre , :remark); ';
    SQLQueryAdd.ParamByName('name').AsString := Edit1.Text;
    SQLQueryAdd.ParamByName('idWriter').AsInteger := idWriter;
    SQLQueryAdd.ParamByName('idGenre').AsInteger := idGenre;
    SQLQueryAdd.ParamByName('remark').AsString := Edit2.Text ;
    SQLQueryAdd.ExecSQL;
    Unit1.Form1.SQLT.Commit;
    ActiveQuery;
  end;


procedure TForm5.Button2Click(Sender: TObject);
  begin
    SQLQuery.Active:= False;
    SQLQueryDel.Close;
    SQLQueryDel.SQL.Text := 'delete from products where id=:id ';
    SQLQueryDel.ParamByName('id').AsInteger := id;
    SQLQueryDel.ExecSQL;
    Unit1.Form1.SQLT.Commit;
    ActiveQuery;
  end;


procedure TForm5.ActiveQuery;
  begin
     Unit1.Form1.SQLQuery.Active := True;
     SQLQuery.Active:= True;
     SQLQuery1.Active:= True;
     SQLQuery2.Active:= True;
  end;

procedure TForm5.DBGrid1CellClick(Column: TColumn);
  begin
     id := SQLQuery.FieldByName('id').AsInteger;

     Edit1.text := SQLQuery.FieldByName('name').AsString;
     DBLookupComboBox1.KeyValue := SQLQuery.FieldByName('idWriter').AsInteger;
     DBLookupComboBox2.KeyValue := SQLQuery.FieldByName('idGenre').AsInteger;
     Edit2.text := SQLQuery.FieldByName('remark').AsString;

  end;

procedure TForm5.Button3Click(Sender: TObject);
begin
    SQLQuery.Active:= False;
    SQLQueryZapros.Close;
    SQLQueryZapros.sql.clear;

    SQLQueryZapros.SQL.Text := 'update products set name = :name, idWriter = :idWriter, ';
    SQLQueryZapros.SQL.Add('idGenre = :idGenre, remark = :remark ');
    SQLQueryZapros.SQL.Add('where id = :id ');

    SQLQueryZapros.ParamByName('name').AsString :=  Edit1.Text;
    SQLQueryZapros.ParamByName('idWriter').AsInteger := DBLookupComboBox1.KeyValue;
    SQLQueryZapros.ParamByName('idGenre').AsInteger := DBLookupComboBox2.KeyValue;
    SQLQueryZapros.ParamByName('remark').AsString := Edit2.Text;

    SQLQueryZapros.ExecSQL;
    Unit1.Form1.SQLT.Commit;
    ActiveQuery;
  end;

procedure TForm5.DBLookupComboBox1Select(Sender: TObject);
  begin
    idWriter := DBLookupComboBox1.KeyValue;
  end;

procedure TForm5.DBLookupComboBox2Select(Sender: TObject);
  begin
     idGenre := DBLookupComboBox2.KeyValue;
  end;

procedure TForm5.FormShow(Sender: TObject);
  begin
     ActiveQuery;
  end;

end.

