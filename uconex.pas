unit uconex;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    ZConnection: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  ZConnection.Database:='C:\wayssoft\wmn\w1\database\$ERP_w1.FDB';
  ZConnection.HostName:='localhost';
  ZConnection.User:='SYSDBA';
  ZConnection.Password:='masterkey';
  ZConnection.Port:=3050;
  ZConnection.Connected:=True;
end;

end.

