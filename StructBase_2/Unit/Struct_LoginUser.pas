unit Struct_LoginUser;

interface
type
   TLoginUser = class(TObject)
  private
    fUrl: string;
    fparams: string;
    fdownloadserver: string;
    ffilename: string;
    fusername: string;
    factions: string;
    fuserid: string;
    fpassword: string;
    factions_filter: string;
    frealusername: string;
    fdwdm: string;
    flxdh:String;
    procedure setUrl(const Value: string);
    procedure setDownloadserver(const Value: string);
    procedure setFilename(const Value: string);
    procedure setParams(const Value: string);
    procedure setusername(const Value: string);
    procedure setuserid(const Value: string);
    procedure setactions(const Value: string);
    procedure setpassword(const Value: string);
    procedure setactions_filter(const Value: string);
    procedure setrealusername(const Value: string);
    procedure setfuserid(const Value: string);

  public
      constructor Create; overload;
      procedure Assign(const Value: TLoginUser);overload;
      property  url:string  read fUrl write setUrl;
      property  params:string  read fparams write setParams;
      property  filename:string  read ffilename write setFilename;
      property  downloadserver:string  read fdownloadserver write setDownloadserver;
      property  username:string  read fusername write setusername;
      property  userid:string  read fuserid write setfuserid;
      property  realusername:string  read frealusername write setrealusername;
      property  actions:string  read factions write setactions;
      property  password:string  read fpassword write setpassword;
      property  actions_filter:string  read factions_filter write setactions_filter;
      property  dwdm:string  read fdwdm write fdwdm;
      property  lxdh:string  read flxdh write flxdh;
  end;

implementation

procedure TLoginUser.Assign(const Value: TLoginUser);
begin
  inherited;
    fUrl:=Value.fUrl;
    fparams:=Value.fparams                 ;
    fdownloadserver:=value.fdownloadserver;
    ffilename:=value.ffilename;
    fusername:=Value.fusername;
    factions:=Value.factions;
    fpassword:=value.fpassword;
    factions_filter:=value.factions_filter;
    frealusername:=value.frealusername;

end;

constructor TLoginUser.Create() ;
begin
     fUrl:='';
     fparams:='';
     fdownloadserver:='';
     ffilename:='';
     factions:='';
     fpassword:='';
end;




procedure TLoginUser.setactions(const Value: string);
begin
  factions := Value;
end;

procedure TLoginUser.setactions_filter(const Value: string);
begin
  factions_filter := Value;
end;



procedure TLoginUser.setDownloadserver(const Value: string);
begin
  fdownloadserver := Value;
end;

procedure TLoginUser.setFilename(const Value: string);
begin
  ffilename := Value;
end;

procedure TLoginUser.setfuserid(const Value: string);
begin
  fuserid := Value;
end;

procedure TLoginUser.setParams(const Value: string);
begin
  fparams := Value;
end;

procedure TLoginUser.setpassword(const Value: string);
begin
  fpassword := Value;
end;

procedure TLoginUser.setrealusername(const Value: string);
begin
  frealusername := Value;
end;

procedure TLoginUser.setUrl(const Value: string);
begin
  fUrl := Value;
end;

procedure TLoginUser.setuserid(const Value: string);
begin

end;

procedure TLoginUser.setusername(const Value: string);
begin
  fusername := Value;
end;

end.
