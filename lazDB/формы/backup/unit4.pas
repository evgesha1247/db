unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSourceDel: TDataSource;
    DBGrid1: TDBGrid;
    EditName: TEdit;
    EditPatronymic: TEdit;
    EditSurname: TEdit;
    EditYearB: TEdit;
    EditYearD: TEdit;
    EditCountry: TEdit;
    EditPlace: TEdit;
    EditRemark: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SQLQuery: TSQLQuery;
    SQLQueryDel: TSQLQuery;
    SQLQueryAdd: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private

  public
     procedure ClearAndActivety;
  end;

var
  Form6: TForm6;
   id : integer ;
implementation
      uses Unit1;
{$R *.lfm} { TForm6 }

procedure TForm6.ClearAndActivety;
  begin
   EditName.Text:='';
   EditPatronymic.Text:='';
   EditSurname.Text:='';
   EditYearB.Text:='';
   EditYearD.Text:='';
   EditCountry.Text:='';
   EditPlace.Text:='';
   EditRemark.Text:='';

   Unit1.Form1.SQLT.Commit;
   SQLQuery.Active:= True;
   Unit1.Form1.SQLQuery.Active := True;
  end;

procedure TForm6.Button1Click(Sender: TObject);
  begin
  SQLQuery.Active:= False;
  SQLQueryAdd.Close;
  SQLQueryAdd.Clear;
  SQLQueryAdd.SQL.Text := 'insert into writers(id, name, patronymic , surname ,yearOfBirth , yearOfDeath , country , placeOfBirth , remark) ';
  SQLQueryAdd.SQL.Add('values(:id, :name,  :patronymic , :surname , :yearOfBirth , :yearOfDeath , :country , :placeOfBirth , :remark); ');
  SQLQueryAdd.ParamByName('name').AsString := EditName.Text;
  SQLQueryAdd.ParamByName('patronymic').AsString := EditPatronymic.Text;
  SQLQueryAdd.ParamByName('surname').AsString := EditSurname.Text;
  SQLQueryAdd.ParamByName('yearOfBirth').AsInteger := StrToInt(EditYearB.Text);
  SQLQueryAdd.ParamByName('yearOfDeath').AsInteger := StrToInt(EditYearD.Text);
  SQLQueryAdd.ParamByName('country').AsString := EditCountry.Text;
  SQLQueryAdd.ParamByName('placeOfBirth').AsString := EditPlace.Text;
  SQLQueryAdd.ParamByName('remark').AsString := EditRemark.Text;
  SQLQueryAdd.ExecSQL;
  ClearAndActivety;
  end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  SQLQuery.Active:= False;
  SQLQueryDel.Close;
  SQLQueryDel.Clear;
  SQLQueryDel.SQL.Text := 'delete from writers where id=:id ';
  SQLQueryDel.ParamByName('id').AsInteger := id;
  SQLQueryDel.ExecSQL;
  ClearAndActivety
end;

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin
   id := SQLQuery.FieldByName('id').AsInteger;
end;


procedure TForm6.FormShow(Sender: TObject);
begin
    Unit1.Form1.SQLC.Connected := True;
    SQLQuery.Active:= True;
end;




end.

