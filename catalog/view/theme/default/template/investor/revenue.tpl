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
    				<h2>財務概況</h2>
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
					<div class="col-md-3 sidebar left-sidebar">
						<?php echo $left ?>
					</div>
					<div class="col-md-9">
						<h3 class="title investor-title"><i class="fa fa-area-chart"></i> 財務概況</h3>
						
						<h4 class="page-sub-title"><i class="fa fa-th-large"></i> 月營收報告</h4>
						
						<div class="margin-30 clearfix">
						<select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)">
							<option value="index.php?route=investor/revenue&filter_year=no">選擇年份</option>
							<?php foreach($year as $year_v) {?>
							<option <?php if($this->request->get['filter_year']==$year_v['year']){echo "selected ='true'" ;} ?>value="index.php?route=investor/revenue&filter_year=<?php echo $year_v['year'] ?>"><?php echo $year_v['year'] ?>年</option>
							<?php } ?>
							</select>
						</div>
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="text-align:center;">標題</th>
										<th width="80" class="text-align-center">附檔</th>
									</tr>
								</thead>
								<tbody>
									<?php foreach($investor as $investor_s){ ?>
									<?php foreach($investor_s as $investor_v) {?>
									<tr>
										<td><?php echo $investor_v['name'] ?></td>
										<td align="center"><?php if($investor_v['url']){ ?><a href="index.php?route=investor/directors/download&download=<?php echo $investor_v['url']?>"><i class="fa fa-download"></i></a><?php } ?></td>
									</tr>
									<?php } ?>
									<?php } ?>
								</tbody>
							</table>
						</div>
						
						<div class="padding-tb20 clearfix">
							<h3>公開資訊觀測站--採用IFRSs後之月營業收入資訊</h3>
							<div>
								<a href="http://mops.twse.com.tw/mops/web/t05st10_ifrs" target="_blank" class="btn btn-block btn-lg btn-investor">公開資訊觀測站</a>
							</div>
						</div>
						
					</div>
				</div>
            </div>
       	</div>
   	</div>
<?php echo $footer; ?>