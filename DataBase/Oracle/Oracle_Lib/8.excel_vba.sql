-- 7.在Word或Excel中用VBA编程
-- 至少直接从oracle数据库中调用自定义函数“rentalsum_姓名首字母_学号后三位”取出租赁费金额，
-- 写一个经营情况分析报告。
Private Sub rental_report()

  Dim connect As New ADODB.Connection
  Dim result_set_1 As New ADODB.Recordset
  Dim result_set_2 As New ADODB.Recordset
  result_set_1.CursorLocation = adUseClient

  connect.Open "Provider=OraOleDb.Oracle;Password=wlx303;User ID=wlx303;Data Source=localhost:1521/wlx"
  result_set_1.Open ("select t.TITLE_NAME, m.LAST_NAME, r.copy_id ,r.EXP_RET_DATE
  	from RENTAL_WLX303 r , MEMBER_WLX303 m ,TITLE_WLX303 t
  	where r.MEMBER_ID=m.MEMBER_ID and r.TITLE_ID = t.TITLE_ID
  	order by r.EXP_RET_DATE"), connect, adOpenKeyset, adLockReadOnly

	i = 1
	'当指针未移到末尾时继续
	Do While Not result_set_1.EOF
      Cells(i + 1, "A") = result_set_1("TITLE_NAME")
      Cells(i + 1, "B") = result_set_1("LAST_NAME")
      Cells(i + 1, "C") = result_set_1("copy_id")
      Cells(i + 1, "D") = result_set_1("EXP_RET_DATE")
      Cells(i + 1, "D").Select
      Selection.NumberFormatLocal = "yyyy""年""m""月""d""日"";@"
      result_set_1.MoveNext
      'i加1，准备把下一记录相关字段的值保存到工作表的下一行
      i = i + 1
    Loop
    Set result_set_1 = Nothing

	result_set_2.CursorLocation = adUseClient
	result_set_2.Open ("SELECT RENTALSUM_WLX303 as sum FROM dual"), connect, adOpenKeyset, adLockReadOnly
 	'当指针未移到末尾时继续
 	Do While Not result_set_2.EOF
      Cells(2, "E") = result_set_2("sum")
      '把指针移向下一条记录
      result_set_2.MoveNext
    Loop
 Set result_set_2 = Nothing
 Set connect = Nothing
End Sub