<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=utf-8" />
<title>home.jsp</title>
<link rel="stylesheet" type="text/css" href="css/home1.css" />
<script src="js/jquery-3.4.1.min.js"></script>
</head>
<script>
	$(function() {
		$('.nav').on('click', 'li', function() {
			$(this).addClass('clickstyle');
			$(this).siblings().removeClass('clickstyle');
		})
	})
	$(function() {
		$(".nav li").click(
				function() {//获取点击事件的对象
					var divShow = $(".displayArea").children('.list');//获取要显示或隐藏的对象
					if (!$(this).hasClass('selected')) {//判断当前对象是否被选中，如果没选中的话进入if循环
						var index = $(this).index();//获取当前对象的索引
						$(this).addClass('selected').siblings('li')
								.removeClass('selected');//当前对象添加选中样式并且其同胞移除选中样式；
						$(divShow[index]).show();//索引对应的div块显示
						$(divShow[index]).siblings('.list').hide();//索引对应的div块的同胞隐藏
					}
				});
	});
</script>
<body>
	<div class="container">
		<div class="left">
			<div class="logo">
				<img src="images/2.png" width="248" height="85">
			</div>
			<form id="form0" ation="" method="get" name="UserInf">
				<div class="LoginInf">
					<div class="LoginImg" id="Login-img">
						<span class="UploadHead"> <a href="#" target="_blank">
								<img src="images/no-head.jpg" width="100" height="100">
						</a></span>
					</div>
					<div class="LoginInformation">
						<div class="login-div-name">
							<td class="UserName"><label for="username">姓 名: </label></td>
							<td class="">${requestScope.user.username}</td>
						</div>
						<div class="login-div-job">
							<td class="UserJob"><label for="userjob">职 位: </label>
							<td class="">Web前端</td>
						</div>
						<div class="login-div-userid">
							<td class=""><label for="userid"> I D : </label>
							<td class="">000000000</td>
						</div>
					</div>
				</div>
			</form>
			<ul class="nav">
				<li class="selected"><div class="Navbar">
						<a href="html/MainPage.html">首页 MainPage &nbsp;</a>
					</div></li>
				<li><div class="Navbar">
						<a href="html/On-Off.html">开关 On-Off
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</div></li>
				<li><div class="Navbar">
						<a href="html/Socket.html">插座 Socket
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</div></li>
				<li><div class="Navbar">
						<a href="html/Curtain.html">窗帘 Curtain
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</div></li>
				<li><div class="Navbar">
						<a href="html/Router.html">路由 Router
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</div></li>
				<li><div class="Navbar">
						<a href="html/PAS.html">新风系统 PAS
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</div></li>
			</ul>
		</div>
		<!-- left-->
		<div class="displayArea">
			<div class="center">
				<div class="distribution">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>设备分布情况</b>
				</div>
				<div class="refresh">
					<a href="#" target="_blank"><img src="icon/refresh.png"
						width="48" height="45"></a>
				</div>
				<div>
					<img src="icon/redline.png" width="1180" height="3">
				</div>
				<div class="mapData"></div>
			</div>
			<!-- center-->

			<div class="right">
				<div class="calendar">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>系统日历</b>
				</div>
				<div class="refresh1">
					<a href="#" target="_blank"><img src="icon/refresh1.png"
						width="45" height="45"> </a>
				</div>
				<div>
					<img src="icon/redline.png" width="420" height="3">
				</div>

				<div class="calendar1">
					<div class="title1">
						<div class="year"></div>
						<div class="year"></div>
						<div class="year" id="calendar-year"></div>
						<div class="year1">年</div>
						<div class="month" id="calendar-month"></div>
						<div class="year"></div>
						<a href="" id="pre"> <b> < </b>
						</a> <a href="" id="next"><b> > </b></a>
					</div>

					<div class="body1">
						<div class="lightgrey body-list">
							<ul>
								<li>日</li>
								<li>一</li>
								<li>二</li>
								<li>三</li>
								<li>四</li>
								<li>五</li>
								<li>六</li>

							</ul>

						</div>

						<div class="darkgrey body-list">
							<ul id="days">

							</ul>
						</div>
					</div>
				</div>

				<script type="text/javascript">
					var month_olypic = [ 31, 29, 31, 30, 31, 30, 31, 31, 30,
							31, 30, 31 ];//闰年每个月份的天数
					var month_normal = [ 31, 28, 31, 30, 31, 30, 31, 31, 30,
							31, 30, 31 ];
					var month_name = [ "1月", "2月", "3月", "4月", "5月", "6月",
							"7月", "8月", "9月", "10月", "11月", "12月" ];
					//获取以上各个部分的id
					var holder = document.getElementById("days");
					var prev = document.getElementById("prev");
					var next = document.getElementById("next");
					var ctitle = document.getElementById("calendar-month");
					var cyear = document.getElementById("calendar-year");
					//获取当天的年月日
					var my_date = new Date();
					var my_year = my_date.getFullYear();//获取年份
					var my_month = my_date.getMonth(); //获取月份，一月份的下标为0
					var my_day = my_date.getDate();//获取当前日期

					//根据年月获取当月第一天是周几
					function dayStart(month, year) {
						var tmpDate = new Date(year, month, 1);
						return (tmpDate.getDay());
					}
					//根据年份判断某月有多少天(11,2018),表示2018年12月
					function daysMonth(month, year) {
						var tmp1 = year % 4;
						var tmp2 = year % 100;
						var tmp3 = year % 400;

						if ((tmp1 == 0 && tmp2 != 0) || (tmp3 == 0)) {
							return (month_olypic[month]);//闰年
						} else {
							return (month_normal[month]);//非闰年
						}
					}
					//js实现str插入li+class,不要忘了用innerhtml进行插入
					function refreshDate() {
						var str = "";
						//计算当月的天数和每月第一天都是周几，day_month和day_year都从上面获得
						var totalDay = daysMonth(my_month, my_year);
						var firstDay = dayStart(my_month, my_year);
						//添加每个月的空白部分
						for (var i = 0; i < firstDay; i++) {
							str += "<li>" + "</li>";
						}

						//从一号开始添加知道totalDay，并为pre，next和当天添加样式
						var myclass;
						for (var i = 1; i <= totalDay; i++) {
							//三种情况年份小，年分相等月份小，年月相等，天数小
							//点击pre和next之后，my_month和my_year会发生变化，将其与现在的直接获取的再进行比较
							//i与my_day进行比较,pre和next变化时，my_day是不变的
							console
									.log(my_year + " " + my_month + " "
											+ my_day);
							console.log(my_date.getFullYear() + " "
									+ my_date.getMonth() + " "
									+ my_date.getDay());
							if ((my_year < my_date.getFullYear())
									|| (my_year == my_date.getFullYear() && my_month < my_date
											.getMonth())
									|| (my_year == my_date.getFullYear()
											&& my_month == my_date.getMonth() && i < my_day)) {
								myclass = " class='lightgrey'";
							} else if (my_year == my_date.getFullYear()
									&& my_month == my_date.getMonth()
									&& i == my_day) {
								myclass = "class = 'green greenbox'";
							} else {
								myclass = "class = 'darkgrey'";
							}
							str += "<li "+myclass+">" + i + "</li>";
						}
						holder.innerHTML = str;
						ctitle.innerHTML = month_name[my_month];
						cyear.innerHTML = my_year;
					}
					//调用refreshDate()函数，日历才会出现
					refreshDate();
					//实现onclick向前或向后移动
					pre.onclick = function(e) {
						e.preventDefault();
						my_month--;
						if (my_month < 0) {
							my_year--;
							my_month = 11; //即12月份
						}
						refreshDate();
					}

					next.onclick = function(e) {
						e.preventDefault();
						my_month++;
						if (my_month > 11) {
							my_month = 0;
							my_year++;
						}
						refreshDate();
					}
				</script>
			</div>
			<!--right-->
			<div class="footer">
				<div class="diviceInf">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>设备详情</b>
				</div>
				<div class="refresh2">
					<a href="#" target="_blank"><img src="icon/refresh.png"
						width="45" height="48"></a>
				</div>
				<div>
					<img src="icon/redline.png" width="1628" height="3">
				</div>
				<div class="diviceType1">
					<div class="On-Off">
						<div class="on-off-img">
							<img src="icon/on-off.jpg">
						</div>
						<div class="on-off-name">
							<b>开 关</b>
						</div>
					</div>
					<div class="on-off-inf">
						<form action="" method="get" name="On-Off-Inf" id="on_off">
							<div class="sum">
								<b>设备总数：17</b>
							</div>
							<div class="online">
								<b>在线设备：</b>
							</div>
							<div class="onlinesum">
								<b>9</b>
							</div>
						</form>
					</div>
				</div>

				<div class="diviceType2">
					<div class="Socket">
						<div class="socket-img">
							<img src="icon/socket.jpg">
						</div>
						<div class="socket-name">
							<b>插 座</b>
						</div>
					</div>
					<div class="socket-inf">
						<form action="" method="get" name="Socket-Inf" id="socket">
							<div class="sum">
								<b>设备总数：6</b>
							</div>
							<div class="online">
								<b>在线设备：</b>
							</div>
							<div class="onlinesum">
								<b>3</b>
							</div>
						</form>
					</div>
				</div>

				<div class="diviceType3">
					<div class="Curtain">
						<div class="curtain-img">
							<img src="icon/curtain.jpg">
						</div>
						<div class="curtain-name">
							<b>窗 帘</b>
						</div>
					</div>
					<div class="curtain-inf">
						<form action="" method="get" name="Curtain-Inf" id="curtain">
							<div class="sum">
								<b>设备总数：2</b>
							</div>
							<div class="online">
								<b>在线设备：</b>
							</div>
							<div class="onlinesum">
								<b>1</b>
							</div>
						</form>
					</div>
				</div>
				<div class="diviceType4">
					<div class="Router">
						<div class="router-img">
							<img src="icon/router.png" width="78" height="78">
						</div>
						<div class="router-name">
							<b>路 由</b>
						</div>
					</div>
					<div class="router-inf">
						<form action="" method="get" name="Router-Inf" id="router">
							<div class="sum">
								<b>设备总数：2</b>
							</div>
							<div class="online">
								<b>在线设备：</b>
							</div>
							<div class="onlinesum">
								<b>1</b>
							</div>
						</form>
					</div>
				</div>
				<div class="diviceType5">
					<div class=" PAS">
						<div class="pas-img">
							<img src="icon/NWS.jpg" width="78" height="78">
						</div>
						<div class="pas-name">
							<b>新风系统</b>
						</div>
					</div>
					<div class="pas-inf">
						<form action="" method="get" name="PAS-Inf" id="pas">
							<div class="sum">
								<b>设备总数：1</b>
							</div>
							<div class="online">
								<b>在线设备：</b>
							</div>
							<div class="onlinesum">
								<b>1</b>
							</div>
						</form>
					</div>
				</div>

			</div>
			<!--footer-->
		</div>



	</div>
	<!--container-->
</body>
</html>