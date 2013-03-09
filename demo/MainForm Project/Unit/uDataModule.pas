unit uDataModule;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  TMyDataModule = class(TDataModule)
    ImageListForBtns: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MyDataModule: TMyDataModule;

implementation

{$R *.dfm}

end.
