{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     �й����Լ��Ŀ���Դ�������������                         }
{                   (C)Copyright 2001-2007 CnPack ������                       }
{                   ------------------------------------                       }
{                                                                              }
{            ���������ǿ�Դ��������������������� CnPack �ķ���Э������        }
{        �ĺ����·�����һ����                                                }
{                                                                              }
{            ������һ��������Ŀ����ϣ�������ã���û���κε���������û��        }
{        �ʺ��ض�Ŀ�Ķ������ĵ���������ϸ���������� CnPack ����Э�顣        }
{                                                                              }
{            ��Ӧ���Ѿ��Ϳ�����һ���յ�һ�� CnPack ����Э��ĸ��������        }
{        ��û�У��ɷ������ǵ���վ��                                            }
{                                                                              }
{            ��վ��ַ��http://www.cnpack.org                                   }
{            �����ʼ���master@cnpack.org                                       }
{                                                                              }
{******************************************************************************}

unit uCnCeConstSql;
{* |<PRE>
================================================================================
* ������ƣ�������������
* ��Ԫ���ƣ�Delphi ������������ⵥԪ
* ��Ԫ���ߣ�SkyJacker
* ��    ע���õ�Ԫ�����˴�������ʹ�õ� Sql ���
* ����ƽ̨��WinXP sp2  + Delphi 6.0 up2
* ���ݲ��ԣ���
* �� �� �����õ�Ԫ�е��ַ��������ϱ��ػ�����ʽ
* ��Ԫ��ʶ��$Id: uCnCeConstSql.pas,v 1.0 2007/03/06 14:36:27 SkyJacker Exp $
* �޸ļ�¼��2007.03.14
*               ������Ԫ
================================================================================
|</PRE>}

interface

const

//==============================================================================
// MsSqlServer2000 ���
//==============================================================================

  // ����������ݱ���
//  cnSql_AllTable = 'select [name] as TabName,type as TabType, Info as ColumnNums from sysobjects '
//    + ' where type = ''U'' and [Name]<> ''dtproperties'' order by [Name] ';
//
//  //��ʾĳһ�����ݱ�������ֶε�������Ϣ
//  cnSql_ColumnInfo ='select syscolumns.name as ColumnName,syscolumns.xtype as xtype, '
//    + ' systypes.name as TypeName, syscolumns.prec,syscolumns.length as length '
//    + ' from syscolumns ,sysobjects, systypes '
//    + ' where sysobjects.id=syscolumns.id and systypes.xtype=syscolumns.xtype '
//    + ' and  sysobjects.name=''%s'' order by ColOrder';

//==============================================================================
// MySql5 ���
//==============================================================================

   // ����������ݱ���
  cnSql_AllTable = 'select table_name as TabName,table_chinesename,appid  from app_table_name order by appid';

  //��ʾĳһ�����ݱ�������ֶε�������Ϣ
  cnSql_ColumnInfo ='select colname as ColumnName,coltype as xtype, '
    + ' coltype as TypeName, colid,collength as length '
    + ',colchinesename as ColumnChineseName, PkFlag '
    + ' from tabledefine a,app_table_name b'
    + ' where b.table_name=''%s'' and b.table_name=a.tablename and a.appid=b.appid order by colname';



implementation

end.
