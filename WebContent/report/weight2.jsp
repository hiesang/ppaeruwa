<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
<%@ include file="/include/head12.jsp" %>

<style>

</style>

<script type="text/javascript">
$(document).ready(function(){
	
	
 	 /* $("tr").click(function(){ 
 		var daytest1 = '${rtlist.get(0).time}';
	var firstday = daytest1.substring(8,10); 
	var daytest2 = '${rtlist.size()}';
	var lastday =  '${(rtlist.get(rtlist.size()-1).time).substring(8,10)}';
	var asd = 0;

		var tdArr = new Array();	// 배열 선언
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		var wda=td.eq(3).text();
		var wdb=td.eq(1).text();
		
		
		var wd1=$("td:eq(1)").text();
		var wd2=$("td:eq(5)").text();
		var wd3=$("td:eq(9)").text();
		var wd4=$("td:eq(13)").text();
		var wd5=$("td:eq(17)").text();
		var wd6=$("td:eq(21)").text();
		var wd7=$("td:eq(25)").text();
		var wd8=$("td:eq(29)").text();
		var wd9=$("td:eq(33)").text();
		var wd10=$("td:eq(37)").text();
		var wd11=$("td:eq(41)").text();
		var wd12=$("td:eq(45)").text();
		var wd13=$("td:eq(49)").text();
		var wd14=$("td:eq(53)").text();
		var wd15=$("td:eq(57)").text();
		var wd16=$("td:eq(61)").text();
		var wd17=$("td:eq(65)").text();
		var wd18=$("td:eq(69)").text();
		var wd19=$("td:eq(73)").text();
		var wd20=$("td:eq(77)").text();
		var wd21=$("td:eq(81)").text();
		var wd22=$("td:eq(85)").text();
		var wd23=$("td:eq(89)").text();
		var wd24=$("td:eq(93)").text();
		var wd25=$("td:eq(97)").text();
		var wd26=$("td:eq(101)").text();
		var wd27=$("td:eq(105)").text();
		var wd28=$("td:eq(109)").text();

		var mol = '';
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
	
		
		console.log("배열에 담긴 값 : "+tdArr);
		console.log("wda: "+wda);
	
		console.log("wda2: "+typeof wda);
		console.log("wdb: "+ Number(wdb.substring(0,3)));
		console.log("wdb2: "+typeof Number(wdb.substring(0,3)));
		
		
	 	
	Highcharts.chart('container', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: 'Week Kcal'
	    },
	    subtitle: {
	        text: 'Source: WorldClimate.com'
	    },
	    xAxis: {
	        categories: [
	             '1',
	             '2',
	             '3',
	             '4',
	             '5',
	             '6',
	             '7'
	        ],
	        ceiling:(lastday)-(firstday), 
	        crosshair: true
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Kcal (kcal)'
	        }
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y:.1f} kcal</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	     
	    series: [
	    	{
	        name: '아침',
	        data : [Number(wd1.substring(0,3)),Number(wd5.substring(0,3)),Number(wd9.substring(0,3)),Number(wd13.substring(0,3)),Number(wd17.substring(0,3)),Number(wd21.substring(0,3)),Number(wd25.substring(0,3))	]
	        	},
	    
	    {
	        name: '점심',
	        data: [Number(wd2.substring(0,3)),Number(wd6.substring(0,3)),Number(wd10.substring(0,3)),Number(wd14.substring(0,3)),Number(wd18.substring(0,3)),Number(wd22.substring(0,3)),Number(wd26.substring(0,3))]
	    },
	    
	    {
	        name: '저녁',
	        data: [Number(wd3.substring(0,3)),Number(wd7.substring(0,3)),Number(wd11.substring(0,3)),Number(wd15.substring(0,3)),Number(wd19.substring(0,3)),Number(wd23.substring(0,3)),Number(wd27.substring(0,3))]

	    },
	    
	    {
	        name: '간식',
	        data: [Number(wd4.substring(0,3)),Number(wd8.substring(0,3)),Number(wd12.substring(0,3)),Number(wd16.substring(0,3)),Number(wd20.substring(0,3)),Number(wd24.substring(0,3)),Number(wd28.substring(0,3))]

	    }]
	});
		
	}); */ 
	 var daytest1 = '${rtlist.get(0).time}';
	var firstday = daytest1.substring(8,10); 
	var daytest2 = '${rtlist.size()}';
	var lastday =  '${(rtlist.get(rtlist.size()-1).time).substring(8,10)}';
	var asd = 0;

		var tdArr = new Array();	// 배열 선언
		
		// 현재 클릭된 Row(<tr>)
		var tr = $(this);
		var td = tr.children();
		
		var wda=td.eq(3).text();
		var wdb=td.eq(1).text();
		
		
		var wd1=$("td:eq(1)").text();
		var wd2=$("td:eq(5)").text();
		var wd3=$("td:eq(9)").text();
		var wd4=$("td:eq(13)").text();
		var wd5=$("td:eq(17)").text();
		var wd6=$("td:eq(21)").text();
		var wd7=$("td:eq(25)").text();
		var wd8=$("td:eq(29)").text();
		var wd9=$("td:eq(33)").text();
		var wd10=$("td:eq(37)").text();
		var wd11=$("td:eq(41)").text();
		var wd12=$("td:eq(45)").text();
		var wd13=$("td:eq(49)").text();
		var wd14=$("td:eq(53)").text();
		var wd15=$("td:eq(57)").text();
		var wd16=$("td:eq(61)").text();
		var wd17=$("td:eq(65)").text();
		var wd18=$("td:eq(69)").text();
		var wd19=$("td:eq(73)").text();
		var wd20=$("td:eq(77)").text();
		var wd21=$("td:eq(81)").text();
		var wd22=$("td:eq(85)").text();
		var wd23=$("td:eq(89)").text();
		var wd24=$("td:eq(93)").text();
		var wd25=$("td:eq(97)").text();
		var wd26=$("td:eq(101)").text();
		var wd27=$("td:eq(105)").text();
		var wd28=$("td:eq(109)").text();

		var mol = '';
		td.each(function(i){
			tdArr.push(td.eq(i).text());
		});
	
		
		console.log("배열에 담긴 값 : "+tdArr);
		console.log("wda: "+wda);
	
		console.log("wda2: "+typeof wda);
		console.log("wdb: "+ Number(wdb.substring(0,3)));
		console.log("wdb2: "+typeof Number(wdb.substring(0,3)));
		
		
	 	
	Highcharts.chart('container', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: 'Week Kcal'
	    },
	    subtitle: {
	        text: 'Source: WorldClimate.com'
	    },
	    xAxis: {
	        categories: [
	             '1',
	             '2',
	             '3',
	             '4',
	             '5',
	             '6',
	             '7'
	        ],
	        ceiling:(lastday)-(firstday), 
	        crosshair: true
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Kcal (kcal)'
	        }
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y:.1f} kcal</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	     
	    series: [
	    	{
	        name: '아침',
	        data : [Number(wd1.substring(0,3)),Number(wd5.substring(0,3)),Number(wd9.substring(0,3)),Number(wd13.substring(0,3)),Number(wd17.substring(0,3)),Number(wd21.substring(0,3)),Number(wd25.substring(0,3))	]
	        	},
	    
	    {
	        name: '점심',
	        data: [Number(wd2.substring(0,3)),Number(wd6.substring(0,3)),Number(wd10.substring(0,3)),Number(wd14.substring(0,3)),Number(wd18.substring(0,3)),Number(wd22.substring(0,3)),Number(wd26.substring(0,3))]
	    },
	    
	    {
	        name: '저녁',
	        data: [Number(wd3.substring(0,3)),Number(wd7.substring(0,3)),Number(wd11.substring(0,3)),Number(wd15.substring(0,3)),Number(wd19.substring(0,3)),Number(wd23.substring(0,3)),Number(wd27.substring(0,3))]

	    },
	    
	    {
	        name: '간식',
	        data: [Number(wd4.substring(0,3)),Number(wd8.substring(0,3)),Number(wd12.substring(0,3)),Number(wd16.substring(0,3)),Number(wd20.substring(0,3)),Number(wd24.substring(0,3)),Number(wd28.substring(0,3))]

	    }]
	}); 
});
</script>
<!-- contents -->
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

</body>
</html>