unit Struct_Application;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  DBpl_IDBProvide,
  Struct_MetaSource,
  Dialogs;

type
  TStruct_Application = class(TObject)
  private
    FAppId: string;
    FDBProvide: IDBProvideInterface;
    FMetaSource: TStruct_MetaSource;
    FSchema: string;
  public
    property AppId: string read FAppId write FAppId;
    property DBProvide: IDBProvideInterface read FDBProvide write FDBProvide;
    property MetaSource: TStruct_MetaSource read FMetaSource write FMetaSource;
    property Schema: string read FSchema write FSchema;
  end;


implementation



end.
