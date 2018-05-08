<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head4.jsp" %>
<style>

#ui-datepicker-div{
left:56px !important;
top: 74px !important;
}
div#ui-datepicker-div {
    background-color: #eee;
    z-index: 2 !important;
}
.ui-datepicker,
.ui-datepicker-material-header {
  font-family: 'Roboto';
}

.ui-datepicker-material-header {
  display: block;
  background-color: #284B72;
  color: white;
  text-align: center;
  width: 247px;
 
}
.ui-datepicker-material-header .ui-datepicker-material-day {
  background-color: #1F3A58;
  padding: 5px;
  font-size: 1rem;
}
.ui-datepicker-material-header .ui-datepicker-material-date {
  padding: 0px;
}
.ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-month,
.ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-day-num,
.ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-year {
  padding: 0px;
}

.ui-datepicker-calendar td{
    padding: 8px 5px;
    display: table-cell;
    text-align: left;
    vertical-align: middle;
    border-radius: 2px;
}

.ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-month {
  font-size: 2rem;
  text-transform: uppercase;
}
.ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-day-num {
  font-size: 4.5rem;
}
.ui-datepicker-material-header .ui-datepicker-material-date .ui-datepicker-material-year {
  font-size: 1.8rem;
  font-weight: 200;
  color: rgba(255, 255, 255, 0.4);
}

.ui-datepicker {
  padding: 0;
  /* border: 1px solid rgba(0, 0, 0, 0.24); */
  /* -webkit-box-shadow: 0 12px 36px 16px rgba(0, 0, 0, 0.24);
          box-shadow: 0 12px 36px 16px rgba(0, 0, 0, 0.24); */
  width: 247px;
}

.ui-corner-all {
  border-radius: 2;
}

.ui-widget-header {
  border: 0;
}

.ui-datepicker-header {
  text-align: center;
  background: #eee;
  padding-bottom: 0px;
  font-weight: 500;
}
.ui-datepicker-header .ui-datepicker-prev,
.ui-datepicker-header .ui-datepicker-next,
.ui-datepicker-header .ui-datepicker-title {
  border: none;
  outline: none;
  margin: 0px 5px ;
}

.ui-datepicker-prev.ui-state-hover,
.ui-datepicker-next.ui-state-hover {
  border: none;
  outline: none;
  background: #b4cbe5;
}

.ui-datepicker-calendar .ui-state-default {
  background: none;
  border: none;
  text-align: center;
  height: 15px;
  width: 15px;
  line-height: 0px;
  
}
.ui-datepicker-calendar .ui-state-highlight {
  color: #93670e;
}
.ui-datepicker-calendar .ui-state-active {
  border-radius: 100%;
  background-color: #284B72;
  color: white;
}
.ui-datepicker-calendar thead th {
  color: #999999;
  font-weight: 350;
}

.ui-datepicker-buttonpane {
  border: none;
}
.ui-datepicker-buttonpane .ui-state-default {
  background: white;
  border: none;
  
}
.ui-datepicker-buttonpane .ui-datepicker-close,
.ui-datepicker-buttonpane .ui-datepicker-current {
  background: #eee;
  color: #284B72;
  text-transform: uppercase;
  border: none;
  opacity: 1;
  font-weight: 200;
  outline: none;
  font-weight: 500;
}
.ui-datepicker-buttonpane .ui-datepicker-close:hover,
.ui-datepicker-buttonpane .ui-datepicker-current:hover {
  background: #eaeef2;
}


</style>
<script>
$(document).ready(function(){
	
	$('#ui-datepicker-div').css('left',500);
	
	var headerHtml = $("#material-header-holder .ui-datepicker-material-header");

	var changeMaterialHeader = function(header, date) {
	  var year   = date.format('YYYY');
	  var month  = date.format('MMM');
	  var dayNum = date.format('D');
	  var isoDay = date.isoWeekday();
	  
		var weekday = new Array(7);
		weekday[1] = "Monday";
		weekday[2] = "Tuesday";
		weekday[3] = "Wednesday";
		weekday[4] = "Thursday";
		weekday[5] = "Friday";
		weekday[6] = "Saturday";
		weekday[7]=  "Sunday";

	  $('.ui-datepicker-material-day', header).text(weekday[isoDay]);
	  $('.ui-datepicker-material-year', header).text(year);
	  $('.ui-datepicker-material-month', header).text(month);
	  $('.ui-datepicker-material-day-num', header).text(dayNum);
	};

	$.datepicker._selectDateOverload = $.datepicker._selectDate;
	$.datepicker._selectDate = function(id, dateStr) {
	  var target = $(id);
	  var inst = this._getInst(target[0]);
	  inst.inline = true;
	  $.datepicker._selectDateOverload(id, dateStr);
	  inst.inline = false;
	  this._updateDatepicker(inst);
	  
	  headerHtml.remove();
	  $(".ui-datepicker").prepend(headerHtml);
	};

	$("input[data-type='date']").on("focus", function() {
	  //var date;
	  //if (this.value == "") {
	  //  date = moment();
	  //} else {
	  //  date = moment(this.value, 'MM/DD/YYYY');
	  //}

	 	$(".ui-datepicker").prepend(headerHtml);
	  //$(this).datepicker._selectDate(this, date);
	});

	$("input[data-type='date']").datepicker({
	  showButtonPanel: true,
	  closeText: 'OK',
	  onSelect: function(date, inst) {
	    changeMaterialHeader(headerHtml, moment(date, 'MM/DD/YYYY'));
	  },
	});

	changeMaterialHeader(headerHtml, moment());
	$('#dd').click(function(){	
		$("#material-header-holder").show();
	
	});
	

});
</script>
<body>
<div>
	<div>
		<div class="row">
			<div class="col s12 calwidth input-field">
			<input type="text" data-type="date" id="date-input" class="validate" id="dd" />
			
					<div id="material-header-holder" style="display:none">
					  <div class="ui-datepicker-material-header">
					    <div class="ui-datepicker-material-day">
					    </div>
					    <div class="ui-datepicker-material-date">
					      <div class="ui-datepicker-material-month">
					      </div>
					      <div class="ui-datepicker-material-day-num">
					      </div>
					      <div class="ui-datepicker-material-year">
					      </div>
					    </div>
					  </div>
					</div>	
			</div>
		</div>
	</div>
</div>
</body>
</html>