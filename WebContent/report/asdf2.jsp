<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<%@ include file="/include/head12.jsp"%>

	<style>
</style>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							function pad(n, width) {
								n = n + '';
								return n.length >= width ? n : new Array(width
										- n.length + 1).join('0')
										+ n;
							}

							var daytest1 = '${rtlist.get(0).time}';
							var firstday = daytest1.substring(8, 10);
							var daytest2 = '${rtlist.size()}';
							var lastday = '${(rtlist.get(rtlist.size()-1).time).substring(8,10)}';
							var asd = 0;
							var tdArr = new Array(); // 배열 선언

							// 현재 클릭된 Row(<tr>)
							var tr = $(this);
							var td = tr.children();
							var wda = td.eq(3).val();
							var wdb = td.eq(1).text();
							var aaa = '';
							var mol = null;

							td.each(function(i) {
								tdArr.push(td.eq(i).text());
							});

							var tan = Number(($("td:eq(2)").text()).substring(
									2, 4))
									+ Number(($("td:eq(6)").text()).substring(
											2, 4))
									+ Number(($("td:eq(10)").text()).substring(
											2, 4))
									+ Number(($("td:eq(14)").text()).substring(
											2, 4));
							
							var tan1 = Number(($("td:eq(18)").text()).substring(
									2, 4))
									+ Number(($("td:eq(22)").text()).substring(
											2, 4))
									+ Number(($("td:eq(26)").text()).substring(
											2, 4))
									+ Number(($("td:eq(30)").text()).substring(
											2, 4));
							
							var tan2 = Number(($("td:eq(34)").text()).substring(
									2, 4))
									+ Number(($("td:eq(38)").text()).substring(
											2, 4))
									+ Number(($("td:eq(42)").text()).substring(
											2, 4))
									+ Number(($("td:eq(46)").text()).substring(
											2, 4));
							
							var tan3 = Number(($("td:eq(50)").text()).substring(
									2, 4))
									+ Number(($("td:eq(54)").text()).substring(
											2, 4))
									+ Number(($("td:eq(58)").text()).substring(
											2, 4))
									+ Number(($("td:eq(62)").text()).substring(
											2, 4));
							
							var tan4 = Number(($("td:eq(66)").text()).substring(
									2, 4))
									+ Number(($("td:eq(70)").text()).substring(
											2, 4))
									+ Number(($("td:eq(74)").text()).substring(
											2, 4))
									+ Number(($("td:eq(78)").text()).substring(
											2, 4));
							
							var tan5 = Number(($("td:eq(82)").text()).substring(
									2, 4))
									+ Number(($("td:eq(86)").text()).substring(
											2, 4))
									+ Number(($("td:eq(90)").text()).substring(
											2, 4))
									+ Number(($("td:eq(94)").text()).substring(
											2, 4));
							
							var tan6 = Number(($("td:eq(98)").text()).substring(
									2, 4))
									+ Number(($("td:eq(102)").text()).substring(
											2, 4))
									+ Number(($("td:eq(106)").text()).substring(
											2, 4))
									+ Number(($("td:eq(110)").text()).substring(
											2, 4));
							
							var pro = Number(($("td:eq(2)").text()).substring(
									6, 8))
									+ Number(($("td:eq(6)").text()).substring(
											6, 8))
									+ Number(($("td:eq(10)").text()).substring(
											6, 8))
									+ Number(($("td:eq(14)").text()).substring(
											6, 8));
							
							var pro1 = Number(($("td:eq(18)").text()).substring(
									6, 8))
									+ Number(($("td:eq(22)").text()).substring(
											6, 8))
									+ Number(($("td:eq(26)").text()).substring(
											6, 8))
									+ Number(($("td:eq(30)").text()).substring(
											6, 8));
							
							var pro2 = Number(($("td:eq(34)").text()).substring(
									6, 8))
									+ Number(($("td:eq(38)").text()).substring(
											6, 8))
									+ Number(($("td:eq(42)").text()).substring(
											6, 8))
									+ Number(($("td:eq(46)").text()).substring(
											6, 8));
							
							var pro3 = Number(($("td:eq(50)").text()).substring(
									6, 8))
									+ Number(($("td:eq(54)").text()).substring(
											6, 8))
									+ Number(($("td:eq(58)").text()).substring(
											6, 8))
									+ Number(($("td:eq(62)").text()).substring(
											6, 8));
							
							var pro4 = Number(($("td:eq(66)").text()).substring(
									6, 8))
									+ Number(($("td:eq(70)").text()).substring(
											6, 8))
									+ Number(($("td:eq(74)").text()).substring(
											6, 8))
									+ Number(($("td:eq(78)").text()).substring(
											6, 8));
							
							var pro5 = Number(($("td:eq(82)").text()).substring(
									6, 8))
									+ Number(($("td:eq(86)").text()).substring(
											6, 8))
									+ Number(($("td:eq(90)").text()).substring(
											6, 8))
									+ Number(($("td:eq(94)").text()).substring(
											6, 8));
							
							var pro6 = Number(($("td:eq(98)").text()).substring(
									6, 8))
									+ Number(($("td:eq(102)").text()).substring(
											6, 8))
									+ Number(($("td:eq(106)").text()).substring(
											6, 8))
									+ Number(($("td:eq(110)").text()).substring(
											6, 8));
							
							var fat = Number(($("td:eq(2)").text()).substring(
									10, 12))
									+ Number(($("td:eq(6)").text()).substring(
											10, 12))
									+ Number(($("td:eq(10)").text()).substring(
											10, 12))
									+ Number(($("td:eq(14)").text()).substring(
											10, 12));
							
							var fat1 = Number(($("td:eq(18)").text()).substring(
									10, 12))
									+ Number(($("td:eq(22)").text()).substring(
											10, 12))
									+ Number(($("td:eq(26)").text()).substring(
											10, 12))
									+ Number(($("td:eq(30)").text()).substring(
											10, 12));
							
							var fat2 = Number(($("td:eq(34)").text()).substring(
									10, 12))
									+ Number(($("td:eq(38)").text()).substring(
											10, 12))
									+ Number(($("td:eq(42)").text()).substring(
											10, 12))
									+ Number(($("td:eq(46)").text()).substring(
											10, 12));
							
							var fat3 = Number(($("td:eq(50)").text()).substring(
									10, 12))
									+ Number(($("td:eq(54)").text()).substring(
											10, 12))
									+ Number(($("td:eq(58)").text()).substring(
											10, 12))
									+ Number(($("td:eq(62)").text()).substring(
											10, 12));
							
							var fat4 = Number(($("td:eq(66)").text()).substring(
									10, 12))
									+ Number(($("td:eq(70)").text()).substring(
											10, 12))
									+ Number(($("td:eq(74)").text()).substring(
											10, 12))
									+ Number(($("td:eq(78)").text()).substring(
											10, 12));
							
							var fat5 = Number(($("td:eq(82)").text()).substring(
									10, 12))
									+ Number(($("td:eq(86)").text()).substring(
											10, 12))
									+ Number(($("td:eq(90)").text()).substring(
											10, 12))
									+ Number(($("td:eq(94)").text()).substring(
											10, 12));
							
							var fat6 = Number(($("td:eq(98)").text()).substring(
									10, 12))
									+ Number(($("td:eq(102)").text()).substring(
											10, 12))
									+ Number(($("td:eq(106)").text()).substring(
											10, 12))
									+ Number(($("td:eq(110)").text()).substring(
											10, 12));
							
							

							Highcharts
									.chart(
											'container2',
											{
												chart : {
													type : 'column'
												},
												title : {
													text : 'Week Essential Nutrients'
												},
												subtitle : {
													text : 'Source: WorldClimate.com'
												},
												xAxis : {
													categories : [ '1', '2',
															'3', '4', '5', '6',
															'7' ],
													ceiling : (lastday)
															- (firstday),
													crosshair : true
												},
												yAxis : {
													min : 0,
													title : {
														text : 'Kcal (kcal)'
													}
												},
												tooltip : {
													headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
													pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
															+ '<td style="padding:0"><b>{point.y:.1f} kcal</b></td></tr>',
													footerFormat : '</table>',
													shared : true,
													useHTML : true
												},
												plotOptions : {
													column : {
														pointPadding : 0.2,
														borderWidth : 0
													}
												},

												series : [
														{
															name : '탄수화물',
															data : [ tan,tan1,tan2,tan3,tan4,tan5,tan6 ]
														},

														{
															name : '단백질',
															data : [ pro,pro1,pro2,pro3,pro4,pro5,pro6 ]
														},

														{
															name : '지방',
															data : [ fat,fat1,fat2,fat3,fat4,fat5,fat6 ]

														}

												]
											});
						});
	</script>
	<!-- contents -->
	<div id="container2"
		style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</body>
</html>