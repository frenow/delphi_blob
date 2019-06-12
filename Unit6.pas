unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBDatabase, StdCtrls, ExtCtrls, Jpeg;

type
  TForm6 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBDatabase2: TIBDatabase;
    IBTransaction2: TIBTransaction;
    Button1: TButton;
    IBQuery2: TIBQuery;
    DataSource2: TDataSource;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var
  S : TMemoryStream;
  jpgFoto: TJPEGImage;
begin
  try
    with IBQuery1,sql do
    begin
        clear;
        close;
        Add('select FOTO_FUN from tb_cadfuncionario_fun where cod_emp = 3 and cod_fun = 7111204 ');
        Open;
    end;
    S       := TMemoryStream.Create;
    jpgFoto := TJpegImage.Create;
    try
      TGraphicField(IBQuery1.FieldByName('FOTO_FUN')).SaveToStream(s);

    s.Position:=0;
    jpgFoto:=TJPEGImage.Create;
    jpgFoto.LoadFromStream(s);
    Image1.Picture.Graphic := jpgFoto;   


   with IBQuery2,sql do
   begin
      clear;
      close;
      Add('update tb_cadfuncionario_fun set FOTO_FUN =:FOTO where cod_emp = 3 and cod_fun = 7111204');
      ParamByName('FOTO').LoadFromStream(s, FTBLOB);
      Prepare;
      ExecSQL;
   end;
   IBTransaction2.CommitRetaining;
   
   finally
     S.Free;
   end;



    ShowMessage('atualizado com sucess');
  Except
       ShowMessage('exceptionn');

  end;
end;

end.
