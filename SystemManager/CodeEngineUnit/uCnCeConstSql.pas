{******************************************************************************}
{                       CnPack For Delphi/C++Builder                           }
{                     中国人自己的开放源码第三方开发包                         }
{                   (C)Copyright 2001-2007 CnPack 开发组                       }
{                   ------------------------------------                       }
{                                                                              }
{            本开发包是开源的自由软件，您可以遵照 CnPack 的发布协议来修        }
{        改和重新发布这一程序。                                                }
{                                                                              }
{            发布这一开发包的目的是希望它有用，但没有任何担保。甚至没有        }
{        适合特定目的而隐含的担保。更详细的情况请参阅 CnPack 发布协议。        }
{                                                                              }
{            您应该已经和开发包一起收到一份 CnPack 发布协议的副本。如果        }
{        还没有，可访问我们的网站：                                            }
{                                                                              }
{            网站地址：http://www.cnpack.org                                   }
{            电子邮件：master@cnpack.org                                       }
{                                                                              }
{******************************************************************************}

unit uCnCeConstSql;
{* |<PRE>
================================================================================
* 软件名称：开发包基础库
* 单元名称：Delphi 代码引擎基础库单元
* 单元作者：SkyJacker
* 备    注：该单元定义了代码引擎使用的 Sql 语句
* 开发平台：WinXP sp2  + Delphi 6.0 up2
* 兼容测试：无
* 本 地 化：该单元中的字符串均符合本地化处理方式
* 单元标识：$Id: uCnCeConstSql.pas,v 1.0 2007/03/06 14:36:27 SkyJacker Exp $
* 修改记录：2007.03.14
*               创建单元
================================================================================
|</PRE>}

interface

const

//==============================================================================
// MsSqlServer2000 相关
//==============================================================================

  // 获得所有数据表名
//  cnSql_AllTable = 'select [name] as TabName,type as TabType, Info as ColumnNums from sysobjects '
//    + ' where type = ''U'' and [Name]<> ''dtproperties'' order by [Name] ';
//
//  //显示某一个数据表的所有字段的类型信息
//  cnSql_ColumnInfo ='select syscolumns.name as ColumnName,syscolumns.xtype as xtype, '
//    + ' systypes.name as TypeName, syscolumns.prec,syscolumns.length as length '
//    + ' from syscolumns ,sysobjects, systypes '
//    + ' where sysobjects.id=syscolumns.id and systypes.xtype=syscolumns.xtype '
//    + ' and  sysobjects.name=''%s'' order by ColOrder';

//==============================================================================
// MySql5 相关
//==============================================================================

   // 获得所有数据表名
  cnSql_AllTable = 'select table_name as TabName,table_chinesename,appid  from app_table_name order by appid';

  //显示某一个数据表的所有字段的类型信息
  cnSql_ColumnInfo ='select colname as ColumnName,coltype as xtype, '
    + ' coltype as TypeName, colid,collength as length '
    + ',colchinesename as ColumnChineseName, PkFlag '
    + ' from tabledefine a,app_table_name b'
    + ' where b.table_name=''%s'' and b.table_name=a.tablename and a.appid=b.appid order by colname';



implementation

end.
