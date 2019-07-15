<?php
/**
* @copyright Copyright(2008) [OZCHAMP.NET!] All Right Reserved.
* @file $Source: Objects/Core/CSV.php,v$
* @package object
* @subpackage
*
* @author:
* @version: $Id: Objects/Core/CSV.php v1.0 $
*
* @abstract:
*/


/**
* @Class : CSV
*/
class HelperCsvread{
 public $fp = NULL ;
public $filename = NULL;
public $spot = null;

public function __construct($filename = '', $spot = ',')
{
   $this->filename = $filename;
   $this->spot = $spot;
}

    /**函數：打開csv文件
      返回：$fp
      參數：(0,1,2,3),[0--"r"][1--"w"][2--"a"][3--"r+"]
      使用：open(0),open(1),open(2)
    **/
    function open($mode)
    {
     switch($mode)
    {
       case 0:$way="r";break;
       case 1:$way="w";break;
       case 2:$way="a";break;
       case 3:$way="r+";break;
       default:exit("打開模式錯誤！");break;
    }
    $fp = fopen($this->filename,$way);
    if(!$fp)
    {
       exit("打開數據源失敗！");
    }
    $this->fp = $fp;
    }
    /*函數：getField()
      返回：Array
      功能：取得csv文件的字段名稱
      使用：count(Array)取得字段數目,Array[0],Array[1],...,Array[n]取得各字段的名稱
    */
    function getField()
    {
    rewind($this->fp);
    $field = fgetcsv($this->fp,1000,$this->spot);
    if(!$field)
    {
       exit("獲取csv字段名稱失敗！");
    }
    $field_num = count($field);
    if($field_num==0||$field==null)
    {
       exit("字段為空！");
    }
    return $field;
    }
    /*函數：getRecord()
      返回：Array||0 ,0表示到達文件末尾
      功能：取得一行字段數據
      使用：count(Array)取得字段數目,Array[0],Array[1],...,Array[n]取得各字段數據
    */
    function getRecordS()
    {
    $records = Array();
    while($record = fgetcsv($this->fp,1000,$this->spot))
    {
 	  $records[] = $record;
   }
    return $records;
    }

    /*函數：close($fp)
      功能：關閉文件指針
      參數：$fp
      使用：close()
    */
    function close()
    {
     @fclose($this->fp);
    }  
}

?>