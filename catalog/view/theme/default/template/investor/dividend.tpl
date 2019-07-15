<?php echo $header; ?>

<div class="page-header" style="background-image: url(images/banner/info-investor.png)">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6 hidden-xs">
				<ol class="breadcrumb">
					<li><a href="index.php">首頁</a></li>
					<li class="active">投資人專區</li>
				</ol>
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<h2>股東專欄</h2>
			</div>
		</div>
	</div>
</div>
<!-- End Page Header -->
<div class="double-border"></div>
<!-- Secondary Header
    <div class="secondary-bar-new">
		<div class="container">
			<h3 class="title"> 董事會</h3>
        </div>
	</div>
	--> 
<!-- Start Body Content -->
<div class="main" role="main">
	<div id="content" class="content full">
		<div class="container">
			<div class="row">
				<div class="col-md-3 sidebar left-sidebar"> <?php echo $left ?> </div>
				<div class="col-md-9">
					<h3 class="title investor-title"><i class="fa fa-area-chart"></i> 股東專欄</h3>
					<h4 class="page-sub-title"><i class="fa fa-th-large"></i> 股利資訊</h4>
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th rowspan="2">年度</th>
									<th rowspan="2">股東會日期</th>
									<th colspan="2">現金股利</th>
									<th colspan="3">股票股利</th>
									<th>合計</th>
								</tr>
								<tr>
									<th>股利<br />(元/股)</th>
									<th>除息<br />交易日</th>
									<th>盈餘配股<br />(元/股)</th>
									<th>公積配股<br />(元/股)</th>
									<th>除權<br />交易日</th>
									<th>(元/股)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">2011</td>
									<td align="center">2012/5/10</td>
									<td align="center">1.80 </td>
									<td align="center">2012/7/9</td>
									<td align="center">－</td>
									<td align="center">－</td>
									<td align="center">－</td>
									<td align="center">1.80 </td>
								</tr>
								<tr>
									<td align="center">2012</td>
									<td align="center">2013/6/14</td>
									<td align="center">3.50 </td>
									<td align="center">2013/7/8</td>
									<td align="center">－</td>
									<td align="center">－</td>
									<td align="center">－</td>
									<td align="center">3.50 </td>
								</tr>
								<tr>
									<td align="center">2013</td>
									<td align="center">2014/6/12</td>
									<td align="center">3.00 </td>
									<td align="center">2014/8/2</td>
									<td align="center">1.00 </td>
									<td align="center">－</td>
									<td align="center">2014/8/2</td>
									<td align="center">4.00 </td>
								</tr>
								<tr>
									<td align="center">2014</td>
									<td align="center">2015/6/15</td>
									<td align="center">4.00 </td>
									<td align="center">2015/8/12</td>
									<td align="center">0.50 </td>
									<td align="center">－</td>
									<td align="center">2015/8/12</td>
									<td align="center">4.50 </td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>