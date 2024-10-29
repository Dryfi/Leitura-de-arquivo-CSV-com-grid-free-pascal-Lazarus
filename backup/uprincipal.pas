unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, csvdataset, Forms, Controls, Graphics, Dialogs,
  DBGrids, ZDataset;

type

  { TForm1 }

  TForm1 = class(TForm)
    CSVDataset1: TCSVDataset;
    CSVDataset1Column1: TStringField;
    CSVDataset1Column2: TStringField;
    CSVDataset1Column3: TStringField;
    CSVDataset1Column4: TStringField;
    ds__csv_FUNCIONARIO_REGRAS: TDataSource;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);
  var
 csvdataSet: TCSVDataSet;

begin

  csvdataSet:= TCSVDataset.Create(Self);

  try

    CSVDataSet.FileName := 'C:\csvTabelaRegras\ECF_FUNCIONARIO_REGRAS_202410291328.csv';

    CSVDataset1.Open;

    ds__csv_FUNCIONARIO_REGRAS.DataSet := CSVDataset1;

    DBGrid1.DataSource := ds__csv_FUNCIONARIO_REGRAS;

  except
    on E: Exception do

      ShowMessage('Erro ao carregar o arquivo CSV: ' + E.Message);
  end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
  var
  SelectedLine: string;
  i: Integer;
begin
  // Verifica se há dados no dataset
  if not CSVDataSet1.IsEmpty then
  begin
    SelectedLine := '';

    // Itera sobre as colunas do dataset
    for i := 0 to CSVDataSet1.FieldCount - 1 do
    begin
      // Adiciona o valor do campo e uma vírgula (ou outro separador)
      SelectedLine := SelectedLine + CSVDataSet1.Fields[i].AsString + ', ';
    end;

    // Remove a última vírgula e espaço
    if SelectedLine <> '' then
      SetLength(SelectedLine, Length(SelectedLine) - 2);

    // Exibe a linha inteira em uma mensagem
    ShowMessage('Regra selecionada: ' + SelectedLine);
  end;
end;



end.

